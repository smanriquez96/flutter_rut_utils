import 'package:flutter_test/flutter_test.dart';
import 'package:rut_utils/src/rut_utils.dart';

void main() {
  group('util: formatRut', () {
    test('it should format the given version rut', () {
      var rut1 = '11111119';
      var expectedRut1 = '1.111.111-9';
      expect(formatRut(rut1), expectedRut1);

      var rut2 = '111111119';
      var expectedRut2 = '11.111.111-9';
      expect(formatRut(rut2), expectedRut2);
    });
  });

  group('util: shortVersionRutFormat', () {
    test('it should format a short version rut', () {
      var rut1 = '19';
      var expectedRut1 = '1.9';
      expect(shortVersionRutFormat(rut1), expectedRut1);

      var rut2 = '119';
      var expectedRut2 = '1.19';
      expect(shortVersionRutFormat(rut2), expectedRut2);

      var rut3 = '11119';
      var expectedRut3 = '1.111.9';
      expect(shortVersionRutFormat(rut3), expectedRut3);

      var rut4 = '111119';
      var expectedRut4 = '1.111.19';
      expect(shortVersionRutFormat(rut4), expectedRut4);

      var rut5 = '1111119';
      var expectedRut5 = '1.111.119';
      expect(shortVersionRutFormat(rut5), expectedRut5);

      var rut6 = '11111119';
      var expectedRut6 = '1.111.111-9';
      expect(shortVersionRutFormat(rut6), expectedRut6);
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

  group('util: getRutCheckDigit', () {
    test('it should get the check digit of the ruts', () {
      var validRut1 = '18085183-6';
      var splittedvalidRut1 = validRut1.split('-');
      expect(getRutCheckDigit(splittedvalidRut1.first), splittedvalidRut1.last);

      var validRut2 = '9043393-8';
      var splittedvalidRut2 = validRut2.split('-');
      expect(getRutCheckDigit(splittedvalidRut2.first), splittedvalidRut2.last);

      var validRut3 = '9698426-K';
      var splittedvalidRut3 = validRut3.split('-');
      expect(getRutCheckDigit(splittedvalidRut3.first), splittedvalidRut3.last);

      var validRut4 = '9375646-0';
      var splittedvalidRut4 = validRut4.split('-');
      expect(getRutCheckDigit(splittedvalidRut4.first), splittedvalidRut4.last);
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
