import 'package:flutter/material.dart';

class SelectCountryForm extends StatefulWidget {
  const SelectCountryForm({super.key});

  @override
  State<SelectCountryForm> createState() => _SelectCountryFormState();
}

class _SelectCountryFormState extends State<SelectCountryForm> {
  String? _selectedCountry;

  final List<String> _countries = ['Россия', 'Польша', 'Америка', 'Беларусь'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        icon: Icon(Icons.map),
        labelText: 'Выберите вашу страну?',
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
    );
  }
}
