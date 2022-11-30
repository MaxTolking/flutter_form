import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/forms/comment_form.dart';
import 'package:flutter_form/widgets/forms/country_form.dart';
import 'package:flutter_form/widgets/forms/email_form.dart';
import 'package:flutter_form/widgets/forms/phone_form.dart';
import 'package:flutter_form/widgets/forms/surname_form.dart';
import 'package:flutter_form/widgets/forms/name_form.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            SurnameForm(),
            PhoneForm(),
            EmailForm(),
            const SelectCountryForm(),
            CommentForm(),
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

      /*_showDialog(name: _nameController.text);
       if (kDebugMode) {
        print('Форма заполнена правильно!');
        print('Фамилия: ${_surnameController.text}');
        print('Телефон: ${_phoneController.text}');
        print('Email: ${_emailController.text}');
        print('Страна: $_countries');
        print('Комментарий: $_commentController');
      } */
    } else {
      _showMessage(
          message:
              'Данные в форме введены неправильно! Пожалуйста, исправьте данные и повторите попытку.');
    }
  }

  void _showMessage({message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        content: Text(
          message!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/* void _showDialog(BuildContext context, {required String name}){
  showDialog(
      context: context, 
      builder: (context,) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          title: const Text('Регистрация прошла успешно!',
              style: TextStyle(color: Colors.blueGrey)),
          content: Text(
            '$name теперь зарегистрирован',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Отлично!',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      });
}
 */