import 'package:flutter/material.dart';

import '../model/user.dart';

class EmailForm extends StatelessWidget {
  EmailForm({super.key});

  final _emailController = TextEditingController();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.blueGrey),
              prefixIcon: const Icon(Icons.mail),
              suffixIcon: GestureDetector(
                  onTap: () {
                    _emailController.clear();
                  },
                  child: const Icon(Icons.delete_outline, color: Colors.red)),
              hintText: 'Введите email адрес',
              helperText: 'Пример: text@text.text',
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0))),
          keyboardType: TextInputType.emailAddress,
          validator: _validateEmail,
          onSaved: (value) => newUser.name = value!,
        ));
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email не может быть пустым';
    } else if (!_emailController.text.contains('@')) {
      return 'Неправильный email адрес';
    }
    return null;
  }
}
