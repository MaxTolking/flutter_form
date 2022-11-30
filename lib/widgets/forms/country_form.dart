import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class SelectCountryForm extends StatefulWidget {
  const SelectCountryForm({super.key});

  @override
  State<SelectCountryForm> createState() => _SelectCountryFormState();
}

class _SelectCountryFormState extends State<SelectCountryForm> {
  String? _selectedCountry;

  final List<String> _countries = ['Россия', 'Польша', 'Америка', 'Беларусь'];

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
            prefixIcon: Icon(Icons.map),
            labelText: 'Выберите вашу страну',
          ),
          items: _countries.map((country) {
            return DropdownMenuItem(
              value: country,
              child: Text(country),
            );
          }).toList(),
          onChanged: (country) {
            if (kDebugMode) {
              print(country);
            }
            setState(() {
              _selectedCountry = country;
              newUser.country = country!;
            });
          },
          value: _selectedCountry,
          validator: (val) {
            return val == null ? 'Выберите страну из списка' : null;
          },
        ));
  }
}
