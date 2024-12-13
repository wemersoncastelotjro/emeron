import 'package:flutter/services.dart';

class CPFInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove todos os caracteres não numéricos
    final numbers = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (numbers.length > 11) {
      return oldValue;
    }

    final formattedValue = StringBuffer();

    for (var i = 0; i < numbers.length; i++) {
      if (i == 3) {
        formattedValue.write('.');
      } else if (i == 6) {
        formattedValue.write('.');
      } else if (i == 9) {
        formattedValue.write('-');
      }
      formattedValue.write(numbers[i]);
    }

    return TextEditingValue(
      text: formattedValue.toString(),
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
