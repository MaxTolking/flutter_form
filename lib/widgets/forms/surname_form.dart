import 'package:flutter/material.dart';

import '../model/user.dart';

class SurnameForm extends StatelessWidget {
  SurnameForm({super.key});

  final _surnameController = TextEditingController();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: TextFormField(
          controller: _surnameController,
          decoration: InputDecoration(
              labelText: 'Фамилия *',
              labelStyle: const TextStyle(color: Colors.blueGrey),
              prefixIcon: const Icon(Icons.person),
              suffixIcon: GestureDetector(
                  onTap: () {
                    _surnameController.clear();
                  },
                  child: const Icon(Icons.delete_outline, color: Colors.red)),
              hintText: 'Введите Вашу фамилию',
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0))),
          validator: _validateSurname,
          onSaved: (value) => newUser.surname = value!,
        ));
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
