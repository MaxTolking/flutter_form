import 'package:flutter/material.dart';

import '../model/user.dart';

class NameForm extends StatelessWidget {
  NameForm({super.key});

  final _nameController = TextEditingController();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
            labelText: 'Имя *',
            labelStyle: const TextStyle(color: Colors.blueGrey),
            hintText: 'Введите Ваше имя',
            prefixIcon: const Icon(
              Icons.person,
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  _nameController.clear();
                },
                child: const Icon(Icons.delete_outline, color: Colors.red)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: Colors.blue, width: 3.0))),
        validator: _validateName,
        onSaved: (value) => newUser.name = value!,
      ),
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

  void dispose() {
    _nameController.dispose();
  }
}
