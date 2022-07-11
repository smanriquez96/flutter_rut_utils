import 'package:flutter_test/flutter_test.dart';
import 'package:rut_utils/src/rut_utils.dart';

void main() {
  group('util: formatRut', () {
    test('it should format the given version rut', () {
      var rut1 = '';
      var expectedRut1 = '';
      expect(formatRut(rut1), expectedRut1);

      var rut2 = '9';
      var expectedRut2 = '-9';
      expect(formatRut(rut2), expectedRut2);

      var rut3 = '19';
      var expectedRut3 = '1-9';
      expect(formatRut(rut3), expectedRut3);

      var rut4 = '119';
      var expectedRut4 = '11-9';
      expect(formatRut(rut4), expectedRut4);

      var rut5 = '1119';
      var expectedRut5 = '.111-9';
      expect(formatRut(rut5), expectedRut5);

      var rut6 = '11119';
      var expectedRut6 = '1.111-9';
      expect(formatRut(rut6), expectedRut6);

      var rut7 = '111119';
      var expectedRut7 = '11.111-9';
      expect(formatRut(rut7), expectedRut7);

      var rut8 = '1111119';
      var expectedRut8 = '.111.111-9';
      expect(formatRut(rut8), expectedRut8);

      var rut9 = '11111119';
      var expectedRut9 = '1.111.111-9';
      expect(formatRut(rut9), expectedRut9);

      var rut10 = '111111119';
      var expectedRut10 = '11.111.111-9';
      expect(formatRut(rut10), expectedRut10);

      var rut11 = '1111111119';
      var expectedRut11 = '.111.111.111-9';
      expect(formatRut(rut11), expectedRut11);

      var rut12 = '11111111119';
      var expectedRut12 = '1.111.111.111-9';
      expect(formatRut(rut12), expectedRut12);
    });
  });

  group('util: deFormatRut', () {
    test('it should format a short version rut', () {
      var rut = '1.111.111-9';
      var expectedRut = '11111119';
      expect(deFormatRut(rut), expectedRut);
    });

    test('it should format a long version rut', () {
      var rut = '11.111.111-9';
      var expectedRut = '111111119';
      expect(deFormatRut(rut), expectedRut);
    });
  });

  group('util: getRutVerificationDigit', () {
    test('it should get the check digit of the ruts', () {
      var validRut1 = '18085183-6';
      var splittedvalidRut1 = validRut1.split('-');
      expect(getRutVerificationDigit(splittedvalidRut1.first),
          splittedvalidRut1.last);

      var validRut2 = '9043393-8';
      var splittedvalidRut2 = validRut2.split('-');
      expect(getRutVerificationDigit(splittedvalidRut2.first),
          splittedvalidRut2.last);

      var validRut3 = '9698426-K';
      var splittedvalidRut3 = validRut3.split('-');
      expect(getRutVerificationDigit(splittedvalidRut3.first),
          splittedvalidRut3.last);

      var validRut4 = '9375646-0';
      var splittedvalidRut4 = validRut4.split('-');
      expect(getRutVerificationDigit(splittedvalidRut4.first),
          splittedvalidRut4.last);
    });
  });

  group('util: isRutValid', () {
    test('it should return true if the rut is valid', () {
      var validRut1 = '18.085.183-6';
      expect(isRutValid(validRut1), true);

      var validRut2 = '9.043.393-8';
      expect(isRutValid(validRut2), true);

      var validRut3 = '9.698.426-K';
      expect(isRutValid(validRut3), true);

      var validRut4 = '9.375.646-0';
      expect(isRutValid(validRut4), true);
    });

    test('it should return false if the rut is invalid', () {
      var invalidRut1 = '18.085.183-';
      expect(isRutValid(invalidRut1), false);

      var invalidRut2 = '9.043.393';
      expect(isRutValid(invalidRut2), false);

      var invalidRut3 = '9.698.4';
      expect(isRutValid(invalidRut3), false);

      var invalidRut4 = '10.375.646-0';
      expect(isRutValid(invalidRut4), false);
    });
  });

  group('util: isUnFormattedRutValid', () {
    test('it should return null if the rut is valid', () {
      var validRut1 = '180851836';
      expect(isUnFormattedRutValid(validRut1), true);

      var validRut2 = '90433938';
      expect(isUnFormattedRutValid(validRut2), true);

      var validRut3 = '9698426K';
      expect(isUnFormattedRutValid(validRut3), true);

      var validRut4 = '93756460';
      expect(isUnFormattedRutValid(validRut4), true);
    });

    test('it should return "Invalid rut" if the rut is invalid', () {
      var invalidRut1 = '18085183';
      expect(isUnFormattedRutValid(invalidRut1), false);

      var invalidRut2 = '9043393';
      expect(isUnFormattedRutValid(invalidRut2), false);

      var invalidRut3 = '96984';
      expect(isUnFormattedRutValid(invalidRut3), false);

      var invalidRut4 = '103756460';
      expect(isUnFormattedRutValid(invalidRut4), false);
    });
  });

  group('util: validateRut', () {
    test('it should return null if the rut is valid', () {
      var validRut1 = '18.085.183-6';
      expect(validateRut(validRut1), null);

      var validRut2 = '9.043.393-8';
      expect(validateRut(validRut2), null);

      var validRut3 = '9.698.426-K';
      expect(validateRut(validRut3), null);

      var validRut4 = '9.375.646-0';
      expect(validateRut(validRut4), null);
    });

    test('it should return "Empty rut" if the rut is null', () {
      expect(validateRut(null), 'Empty rut');
    });

    test('it should return "Empty rut" if the rut is empty', () {
      expect(validateRut(''), 'Empty rut');
    });

    test('it should return "Invalid rut" if the rut is invalid', () {
      var invalidRut1 = '18.085.183-';
      expect(validateRut(invalidRut1), 'Invalid rut');

      var invalidRut2 = '9.043.393';
      expect(validateRut(invalidRut2), 'Invalid rut');

      var invalidRut3 = '9.698.4';
      expect(validateRut(invalidRut3), 'Invalid rut');

      var invalidRut4 = '10.375.646-0';
      expect(validateRut(invalidRut4), 'Invalid rut');
    });
  });
}
