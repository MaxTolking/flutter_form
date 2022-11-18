import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommentForm extends StatelessWidget {
  CommentForm({super.key});

  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: TextFormField(
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
        ));
  }

  String? _validateComment(String? value) {
    if (value!.isEmpty) {
      return 'Напишите комментарий';
    } else {
      return null;
    }
  }
}
