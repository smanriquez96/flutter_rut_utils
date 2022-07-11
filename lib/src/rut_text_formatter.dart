import 'package:flutter/services.dart';
import 'package:rut_utils/src/rut_utils.dart';

import 'constants/constants.dart';

/// Class to be used as a inputFormatters of a [TextFormField].
/// It receives a [TextEditingValue] and format its value as a Chilean RUT.
class RutFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var rut = deFormatRut(newValue.text);
    if (rut.isEmpty) {
      return newValue;
    }
    var verificationDigit = rut.substring(rut.length - 1);

    if (!kAllowedRutVerificationDigitChars.contains(verificationDigit)) {
      return oldValue;
    }

    var finalValue = formatRut(rut);

    return newValue.copyWith(
        text: finalValue.toUpperCase(),
        selection: TextSelection.collapsed(offset: finalValue.length));
  }
}
