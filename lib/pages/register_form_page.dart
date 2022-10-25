// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            TextFormField(
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
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 3.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0))),
              validator: _validateName,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _surnameController,
              decoration: const InputDecoration(
                  labelText: 'Фамилия *',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
                  hintText: 'Введите Вашу фамилию',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 3.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0))),
              validator: _validateSurname,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                  labelText: 'Ваш номер телефона *',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  helperText: 'Формат: (ххх)ххх-хх-хх',
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 3.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0))),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                //FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true),
              ],
              validator: (value) => _validatePhoneNumber(value!)
                  ? null
                  : 'Телефон не был введен как (###)###-##-##',
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  prefixIcon: Icon(Icons.mail),
                  suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
                  hintText: 'Введите email адрес',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 3.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0))),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                labelText: 'Страна?',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (data) {
                print(data);
                setState(() {
                  _selectedCountry = data!;
                });
              },
              value: _selectedCountry,
              validator: (val) {
                return val == null ? 'Выберите страну из списка' : null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _commentController,
              decoration: const InputDecoration(
                  labelText: 'Комментарий',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  prefixIcon: Icon(Icons.add_comment),
                  suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 3.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 3.0))),
              maxLength: 50,
              maxLines: 2,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              validator: _validateComment,
            ),
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

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[А-ЯЁа-яё, A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Поле "Имя" не может быть пустым';
    } else if (!nameExp.hasMatch(value)) {
      return 'Имя не может содержать цифры';
    }
    return null;
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

  bool _validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\-\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email не может быть пустым';
    } else if (!_emailController.text.contains('@')) {
      return 'Неправильный email адрес';
    }
    return null;
  }

  String? _validateComment(String? value) {
    if (value!.isEmpty) {
      return 'Напишите комментарий';
    } else {
      return null;
    }
  }
}
