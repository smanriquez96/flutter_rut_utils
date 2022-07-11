import 'package:collection/collection.dart';

/// Uses de modulus 11 to calculate the verification digit of a Chilean RUT
/// from it's digits.
String getRutVerificationDigit(String rutWithoutVerificationDigit) {
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

/// Returns a [String] with "." and "-" added to the [rut].
String formatRut(String rut) {
  if (rut.isEmpty) {
    return rut;
  }
  var rutLength = rut.length;
  var verificationDigit = '-${rut.substring(rutLength - 1)}';

  var result = '';
  for (var i = 1; i < rutLength; i += 1) {
    var start = rutLength - i - 1;
    var end = rutLength - i;
    result = '${rut.substring(start, end)}$result';
    if (i % 3 == 0) {
      result = '.$result';
    }
  }
  return '$result$verificationDigit';
}

/// Evaluates whether the [rut] is valid or not using the oficial algorithim
/// provided by the Chilean government.
bool isUnFormattedRutValid(String rut) {
  var rutLength = rut.length;
  var rutWithoutVerificationDigit = rut.substring(0, rutLength - 1);
  var verificationDigit = rut.substring(rutLength - 1);
  var checkDigit = getRutVerificationDigit(rutWithoutVerificationDigit);

  if (checkDigit != verificationDigit) {
    return false;
  }

  return true;
}

/// Evaluates whether the [rut] is valid or not using the oficial algorithim
/// provided by the Chilean government.
bool isRutValid(String rut) {
  if (!rut.contains('-')) {
    return isUnFormattedRutValid(rut.replaceAll('.', ''));
  }
  var rutElements = rut.replaceAll('.', '').split('-');
  var rutWithoutVerificationDigit = rutElements.first;
  var verificationDigit = rutElements.last;
  var checkDigit = getRutVerificationDigit(rutWithoutVerificationDigit);

  if (checkDigit != verificationDigit) {
    return false;
  }

  return true;
}

/// Returns a [String] with the "." and "-" removed from de [rut].
String deFormatRut(String rut) => rut.replaceAll('.', '').replaceAll('-', '');

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
