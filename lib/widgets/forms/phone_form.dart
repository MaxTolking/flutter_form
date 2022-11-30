import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';

class PhoneForm extends StatelessWidget {
  PhoneForm({super.key});

  final _phoneController = TextEditingController();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: _phoneController,
          decoration: InputDecoration(
              labelText: 'Ваш номер телефона *',
              labelStyle: const TextStyle(color: Colors.blueGrey),
              helperText: 'Формат: ххх-хх-хх',
              prefixIcon: const Icon(Icons.phone),
              suffixIcon: GestureDetector(
                  onTap: () {
                    _phoneController.clear();
                  },
                  child: const Icon(Icons.delete_outline, color: Colors.red)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0))),
          keyboardType: TextInputType.phone,
          onSaved: (value) => newUser.phone = value!,
          inputFormatters: [
            //FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                allow: true),
          ],
          validator: (value) => _validatePhoneNumber(value!)
              ? null
              : 'Телефон не был введен как ###-##-##',
        ));
  }

  bool _validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\d\d\d\-\d\d\-\d\d$');
    return phoneExp.hasMatch(input);
  }
}
