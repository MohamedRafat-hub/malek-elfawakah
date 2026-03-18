import 'package:flutter/material.dart';

class CustomNotificationWidget extends StatelessWidget {
  const CustomNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        Icons.notifications_outlined,
        color: const Color(0xFF2D9F5D),
      ),
    );
  }
}