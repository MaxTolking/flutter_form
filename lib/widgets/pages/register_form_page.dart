// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/comment_form.dart';
import 'package:flutter_form/widgets/country_form.dart';
import 'package:flutter_form/widgets/email_form.dart';
import 'package:flutter_form/widgets/phone_form.dart';

import '../surname_form.dart';
import '../name_form.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentController = TextEditingController();

  String? _selectedCountry;
  final List<String> _countries = ['Россия', 'Польша', 'Америка', 'Беларусь'];

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Форма Регистрации'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            NameForm(),
            const SizedBox(
              height: 15,
            ),
            SurnameForm(),
            const SizedBox(
              height: 15,
            ),
            PhoneForm(),
            const SizedBox(
              height: 15,
            ),
            EmailForm(),
            const SizedBox(
              height: 15,
            ),
            const SelectCountryForm(),
            const SizedBox(
              height: 15,
            ),
            CommentForm(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }

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
}
