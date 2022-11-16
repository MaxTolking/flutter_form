import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneForm extends StatelessWidget {
  final _phoneController = TextEditingController();

  PhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
          labelText: 'Ваш номер телефона *',
          labelStyle: TextStyle(color: Colors.blueGrey),
          helperText: 'Формат: (ххх)ххх-хх-хх',
          prefixIcon: Icon(Icons.phone),
          suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 3.0))),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        //FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'), allow: true),
      ],
      validator: (value) => _validatePhoneNumber(value!)
          ? null
          : 'Телефон не был введен как (###)###-##-##',
    );
  }

  bool _validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\-\d\d$');
    return phoneExp.hasMatch(input);
  }
}
