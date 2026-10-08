{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  // IR-18, FR-OF-16: `serviceWorkerSettings` is deliberately absent, so no
  // service worker is registered, nothing is cached in the browser and a
  // reload starts from nothing.
  config: {
    // FR-PV-04: the Cerberus API is the only destination. Roboto is bundled
    // with the application; fallback fonts for glyphs it lacks are looked for
    // on this origin rather than fetched from fonts.gstatic.com, the engine's
    // default.
    fontFallbackBaseUrl: "assets/fonts/fallback/",
  },
});
