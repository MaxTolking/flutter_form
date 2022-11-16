import 'package:flutter/material.dart';

class SurnameForm extends StatelessWidget {
  final _surnameController = TextEditingController();

  SurnameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _surnameController,
      decoration: const InputDecoration(
          labelText: 'Фамилия *',
          labelStyle: TextStyle(color: Colors.blueGrey),
          prefixIcon: Icon(Icons.person),
          suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
          hintText: 'Введите Вашу фамилию',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 3.0))),
      validator: _validateSurname,
    );
  }

  String? _validateSurname(String? value) {
    final nameExp = RegExp(r'^[А-ЯЁа-яё, A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Поле "Фамилия" не может быть пустым';
    } else if (!nameExp.hasMatch(value)) {
      return 'Фамилия не может содержать цифры';
    }
    return null;
  }
}
