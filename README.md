# Rut Utils

Rut utils library for validation and formatting of the Chilean RUT.

It uses the [official algorithim](https://www.registrocivil.cl/PortalOI/Manuales/Validacion_de_Run.pdf) published by the Chilean registry office.

## Getting started
```bash
flutter pub add rut_utils
```

### Validation
```dart
import 'package:rut_utils/rut_utils.dart';

var rut = '111111119';
var isValid = isRutValid(rut); // false

var rut = '11.111.111-9';
var isValid = isRutValid(rut); // false
```

### Formatting
```dart
import 'package:rut_utils/rut_utils.dart';

var rut = '111111119';
var formattedRut = formatRut(rut); // 11.111.111-9

var formattedRut = '11.111.111-9';
var rut = deFormatRut(formattedRut); // 111111119
```

### Text Formatter
```dart
import 'package:flutter/material.dart';
import 'package:rut_utils/rut_utils.dart';

Widget _buildRutFormatter() => TextFormField(
      validator: validateRut,
      inputFormatters: [RutFormatter()],
      textCapitalization: TextCapitalization.characters,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        // TODO: add behaiviour
      },
    );
```

## From the developer(s)

Have fun on your flutter projects!
