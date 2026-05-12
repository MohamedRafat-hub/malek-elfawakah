import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // حط صورتك هنا
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.camera_alt_outlined,
                    size: 18, color: Colors.green[700]),
              ),
            ],
          ),
        ),
        Gap(10),
        Column(
          children: [
            const Text(
              'أحمد ياسر',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'mail@mail.com',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}