import 'package:flutter/material.dart';

import 'comment_form.dart';
import 'email_form.dart';
import 'name_form.dart';
import 'phone_form.dart';
import 'submit_form.dart';
import 'surname_form.dart';

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
            CommmentForm(),
            const SizedBox(
              height: 25,
            ),
            SubmitForm(),
          ],
        ),
      ),
    );
  }
}
