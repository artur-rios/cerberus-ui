import 'package:cerberus_ui/app/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Routes.accessFor', () {
    test('Given the routes of System Requirements §5 '
        'When they are classified '
        'Then each requires what the screen surface says', () {
      const expected = {
        Routes.setup: RouteAccess.anonymous,
        Routes.register: RouteAccess.anonymous,
        Routes.signIn: RouteAccess.anonymous,
        Routes.challenge: RouteAccess.challenge,
        Routes.closureCancel: RouteAccess.signedIn,
        Routes.vaultSetup: RouteAccess.signedIn,
        Routes.unlock: RouteAccess.signedIn,
        Routes.recover: RouteAccess.signedIn,
        Routes.settings: RouteAccess.signedIn,
        Routes.deviceSettings: RouteAccess.signedIn,
        Routes.accountSettings: RouteAccess.signedIn,
        Routes.home: RouteAccess.unlocked,
        '/records/new': RouteAccess.unlocked,
        '/records/r-1/edit': RouteAccess.unlocked,
        '/folders/f-1': RouteAccess.unlocked,
        '/collections/c-1/share': RouteAccess.unlocked,
        Routes.shared: RouteAccess.unlocked,
        '/profiles/p-1': RouteAccess.unlocked,
        Routes.softwareAccess: RouteAccess.unlocked,
        Routes.trash: RouteAccess.unlocked,
        Routes.sync: RouteAccess.unlocked,
        Routes.securitySettings: RouteAccess.unlocked,
        Routes.offlineSettings: RouteAccess.unlocked,
        Routes.privacySettings: RouteAccess.unlocked,
      };

      expected.forEach((path, access) {
        expect(Routes.accessFor(path), access, reason: path);
      });
    });

    test('Given a path no route names '
        'When it is classified '
        'Then it needs a session, revealing nothing to a visitor', () {
      expect(Routes.accessFor('/no/such/route'), RouteAccess.signedIn);
    });

    test('Given a path that only shares a prefix with a route '
        'When it is classified '
        'Then it is not mistaken for that route', () {
      expect(Routes.isWithin('/recordsx', Routes.records), isFalse);
      expect(Routes.isWithin('/records/1', Routes.records), isTrue);
    });
  });

  group('Routes.requiresProtocol', () {
    test('Given the routes that unlock or need an unlocked vault '
        'When they are checked '
        'Then they depend on the protocol, and the others do not', () {
      for (final path in [
        Routes.unlock,
        Routes.vaultSetup,
        Routes.recover,
        '/',
      ]) {
        expect(Routes.requiresProtocol(path), isTrue, reason: path);
      }
      for (final path in [Routes.signIn, Routes.settings, Routes.unavailable]) {
        expect(Routes.requiresProtocol(path), isFalse, reason: path);
      }
    });
  });

  group('UnavailableReason', () {
    test('Given each reason '
        'When it round-trips through the query string '
        'Then it is the same reason', () {
      for (final reason in UnavailableReason.values) {
        final location = Uri.parse(Routes.unavailableFor(reason));

        expect(location.path, Routes.unavailable);
        expect(
          UnavailableReason.fromParameter(
            location.queryParameters[Routes.reasonParameter],
          ),
          reason,
        );
      }
    });

    test('Given an unknown reason '
        'When it is read '
        'Then it is the protocol reason', () {
      expect(UnavailableReason.fromParameter('x'), UnavailableReason.protocol);
      expect(UnavailableReason.fromParameter(null), UnavailableReason.protocol);
    });
  });

  group('Routes.startingFor and destinationAfterStart', () {
    test('Given a requested location '
        'When the start holds it '
        'Then the starting location remembers it, query included, and '
        'releases the user to it afterwards (UC-05 step 6)', () {
      final starting = Routes.startingFor(Uri.parse('/records/r-1?tab=x'));

      expect(Uri.parse(starting).path, Routes.starting);
      expect(
        Routes.destinationAfterStart(Uri.parse(starting)),
        '/records/r-1?tab=x',
      );
    });

    test('Given home '
        'When the start holds it '
        'Then nothing is remembered, and home follows', () {
      expect(Routes.startingFor(Uri.parse(Routes.home)), Routes.starting);
      expect(Routes.startingFor(Uri()), Routes.starting);
      expect(
        Routes.destinationAfterStart(Uri.parse(Routes.starting)),
        Routes.home,
      );
    });

    test('Given a remembered destination outside this application, or the '
        'starting screen itself '
        'When the start releases the user '
        'Then it is home instead', () {
      for (final target in [
        'https://elsewhere.example/',
        '//elsewhere.example/x',
        'records',
        Routes.starting,
        '${Routes.starting}?continue=/records',
      ]) {
        final location = Uri(
          path: Routes.starting,
          queryParameters: {Routes.continueParameter: target},
        );
        expect(
          Routes.destinationAfterStart(location),
          Routes.home,
          reason: target,
        );
      }
    });
  });
}
