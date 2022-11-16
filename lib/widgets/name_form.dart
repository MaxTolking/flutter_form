import 'package:flutter/material.dart';

class NameForm extends StatelessWidget {
  NameForm({super.key});

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
          labelText: 'Имя *',
          labelStyle: TextStyle(color: Colors.blueGrey),
          hintText: 'Введите Ваше имя',
          prefixIcon: Icon(
            Icons.person,
          ),
          suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 3.0))),
      validator: _validateName,
    );
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[А-ЯЁа-яё, A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Поле "Имя" не может быть пустым';
    } else if (!nameExp.hasMatch(value)) {
      return 'Имя не может содержать цифры';
    }
    return null;
  }
}
