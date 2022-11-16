import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommmentForm extends StatelessWidget {
  final _commentController = TextEditingController();

  CommmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _commentController,
      decoration: const InputDecoration(
          labelText: 'Комментарий',
          labelStyle: TextStyle(color: Colors.blueGrey),
          prefixIcon: Icon(Icons.add_comment),
          suffixIcon: Icon(Icons.delete_outline, color: Colors.red),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 3.0))),
      maxLength: 50,
      maxLines: 2,
      inputFormatters: [LengthLimitingTextInputFormatter(100)],
      validator: _validateComment,
    );
  }

  String? _validateComment(String? value) {
    if (value!.isEmpty) {
      return 'Напишите комментарий';
    } else {
      return null;
    }
  }
}
