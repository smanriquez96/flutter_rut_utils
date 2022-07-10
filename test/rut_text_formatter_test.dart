import 'package:flutter_test/flutter_test.dart';
import 'package:rut_utils/rut_utils.dart';

void main() {
  group('formatter: RutFormatter', () {
    test('it should format the rut', () {
      var expectedRut = '10.111.111-1';
      var rutToFormat = const TextEditingValue(text: '101111111');
      var formattedRut =
          RutFormatter().formatEditUpdate(TextEditingValue.empty, rutToFormat);
      expect(formattedRut.text, expectedRut);
    });
  });
}
