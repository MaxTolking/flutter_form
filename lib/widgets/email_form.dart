import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  EmailForm({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.blueGrey),
              prefixIcon: Icon(Icons.mail),
              suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
              hintText: 'Введите email адрес',
              helperText: 'Пример: text@text.text',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0))),
          keyboardType: TextInputType.emailAddress,
          validator: _validateEmail,
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
