import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentController = TextEditingController();
  final List<String> _countries = ['Россия', 'Польша', 'Америка', 'Беларусь'];

  SubmitForm({super.key});

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Форма заполнена правильно!');
      print('Имя: ${_nameController.text}');
      print('Фамилия: ${_surnameController.text}');
      print('Телефон: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Страна: $_countries');
      print('Комментарий: $_commentController');
    } else {
      print(
          'Данные в форме введены неправильно! Пожалуйста, исправьте и повторите попытку');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        elevation: 8,
        padding: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: _submitForm,
      child: const Text(
        "Отправить",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
