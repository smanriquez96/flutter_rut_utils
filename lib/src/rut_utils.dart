import 'package:collection/collection.dart';

String getRutCheckDigit(String rutWithoutVerificationDigit) {
  var reverseFactorsArray = List<int>.generate(
          rutWithoutVerificationDigit.length,
          (index) => int.parse(rutWithoutVerificationDigit[index]))
      .reversed
      .toList();

  var sumResult = reverseFactorsArray.foldIndexed<int>(
      0, (index, sum, factor) => sum + factor * ((index % 6) + 2));

  var result = 11 - (sumResult % 11);

  if (result == 11) {
    return '0';
  } else if (result == 10) {
    return 'K';
  } else {
    return result.toString();
  }
}

String shortVersionRutFormat(String rut) {
  var output = StringBuffer();
  var mp = {1: '.', 4: '.', 7: '-'};

  for (var i = 0; i < rut.length; i++) {
    if (mp.containsKey(i)) {
      output.write(mp[i]);
    }
    output.write(rut[i]);
  }

  return output.toString();
}

/// Returns a [String] with "." and "-" added to the [rut].
String formatRut(String rut) {
  var rutLength = rut.length;
  var verificationDigit = rut.substring(rutLength - 1);
  var result =
      '${rut.substring(rutLength - 4, rutLength - 1)}-$verificationDigit';
  for (var i = 4; i < rutLength; i += 3) {
    var start = rutLength - i - 3;
    var end = rutLength - i;
    if (start.isNegative) {
      start = 0;
    }
    result = '${rut.substring(start, end)}.$result';
  }
  return result;
}

/// Evaluates whether the [rut] is valid or not using the oficial algorithim
/// provided by the Chilean goverment.
bool isRutValid(String rut) {
  var rutElements = rut.replaceAll('.', '').split('-');
  var rutWithoutVerificationDigit = rutElements.first;
  var verificationDigit = rutElements.last;
  var checkDigit = getRutCheckDigit(rutWithoutVerificationDigit);

  if (checkDigit != verificationDigit) {
    return false;
  }

  return true;
}

/// Returns a [String] with the "." and "-" removed from de [value].
String deFormatRut(String value) =>
    value.replaceAll('.', '').replaceAll('-', '');

/// Returns [null] if the given [rut] is valid.
///
/// Returns "Empty rut" if the [rut] is [null] or an empty [String].
///
/// Returns "Invalid rut" if the [rut] is invalid.
String? validateRut(String? rut) {
  if (rut == null || rut.isEmpty) {
    return 'Empty rut';
  }

  if (isRutValid(rut)) {
    return null;
  }

  return 'Invalid rut';
}
