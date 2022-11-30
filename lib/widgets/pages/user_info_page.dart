import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  User userInfo;
  UserInfoPage({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о Пользователе'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '${userInfo.name}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                '${userInfo.surname}',
              ),
              leading: const Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              trailing: Text('${userInfo.country}'),
            ),
            ListTile(
              title: Text(
                '${userInfo.comment}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.add_comment,
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              title: Text(
                '${userInfo.phone}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.phone,
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              title: Text(
                '${userInfo.email}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.email,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
