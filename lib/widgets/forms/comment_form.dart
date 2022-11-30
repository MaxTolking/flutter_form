import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';

class CommentForm extends StatelessWidget {
  CommentForm({super.key});

  final _commentController = TextEditingController();

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: TextFormField(
          controller: _commentController,
          decoration: InputDecoration(
              labelText: 'Комментарий',
              labelStyle: const TextStyle(color: Colors.blueGrey),
              prefixIcon: const Icon(Icons.add_comment),
              suffixIcon: GestureDetector(
                  onTap: () {
                    _commentController.clear();
                  },
                  child: const Icon(Icons.delete_outline, color: Colors.red)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 3.0)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0))),
          maxLength: 50,
          maxLines: 2,
          inputFormatters: [LengthLimitingTextInputFormatter(100)],
          validator: _validateComment,
          onSaved: (value) => newUser.name = value!,
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
