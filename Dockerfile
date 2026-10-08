# syntax=docker/dockerfile:1
# check=skip=FromPlatformFlagConstDisallowed
#
# The web image of Cerberus UI (IR-22, Operations & Infrastructure §6.2).
#
#   docker build -t cerberus-ui \
#     --build-arg CERBERUS_API_BASE_URL=https://cerberus-api.example.com .
#
# CERBERUS_API_BASE_URL is compiled into main.dart.js and is readable by anyone
# who loads the page. It is an address, not a secret; never pass a secret as a
# build argument (IR-14).

# ---------------------------------------------------------------------------
# Build stage: a pinned Flutter SDK compiles the web bundle.
#
# The SDK comes from Flutter's official release archive. The archive is
# x64-only, and the output is platform-independent static files, so this stage
# always runs as amd64.
# ---------------------------------------------------------------------------
FROM --platform=linux/amd64 debian:trixie-slim AS build

# pubspec.yaml requires Dart ^3.13.2, which first ships in Flutter 3.47.2.
# FLUTTER_SHA256 is the archive's checksum from
# https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json;
# override it together with FLUTTER_VERSION, or pass it empty to skip the check.
ARG FLUTTER_VERSION=3.47.4
ARG FLUTTER_SHA256=5b45f0ceda99b9bebdc873e7e69f6450aeb4c30f454b505e2e62fc9255a907d3

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl git unzip xz-utils \
 && rm -rf /var/lib/apt/lists/* \
 && useradd --create-home --shell /bin/bash flutter \
 && install -d -o flutter -g flutter /opt/flutter

USER flutter
ENV CI=true \
    FLUTTER_ROOT=/opt/flutter \
    PUB_CACHE=/home/flutter/.pub-cache \
    PATH=/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:$PATH

RUN curl -fsSL -o /tmp/flutter.tar.xz \
      "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
 && if [ -n "$FLUTTER_SHA256" ]; then echo "$FLUTTER_SHA256  /tmp/flutter.tar.xz" | sha256sum -c -; fi \
 && tar -xJf /tmp/flutter.tar.xz -C /opt \
 && rm /tmp/flutter.tar.xz \
 && flutter config --no-analytics --no-cli-animations \
 && dart --disable-analytics \
 && flutter precache --web \
 && flutter --version

WORKDIR /home/flutter/app

# Dependencies first, so source-only changes reuse the resolved packages.
COPY --chown=flutter:flutter pubspec.yaml pubspec.lock ./
COPY --chown=flutter:flutter packages/cerberus_api_client/pubspec.yaml packages/cerberus_api_client/
RUN flutter pub get --enforce-lockfile

COPY --chown=flutter:flutter . .

# The one --dart-define read by lib/core/config/app_config.dart. Empty starts
# the application at its setup screen (UC-01).
ARG CERBERUS_API_BASE_URL=

# --no-web-resources-cdn bundles CanvasKit so the running application fetches
# nothing from gstatic.com (FR-PV-04). The bundle check then confirms no
# service worker, no third-party font and no local store (IR-08, IR-18), and
# the unused worker file Flutter still emits is removed.
RUN flutter build web --release --no-web-resources-cdn \
      --dart-define=CERBERUS_API_BASE_URL=${CERBERUS_API_BASE_URL} \
 && bash tool/check_web_bundle.sh build/web \
 && rm -f build/web/flutter_service_worker.js

# ---------------------------------------------------------------------------
# Runtime stage: static files behind unprivileged nginx on port 8080. No
# application secret exists to carry (IR-22).
# ---------------------------------------------------------------------------
FROM nginxinc/nginx-unprivileged:alpine

COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /home/flutter/app/build/web /usr/share/nginx/html

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
