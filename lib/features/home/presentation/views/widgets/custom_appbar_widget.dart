import 'package:flutter/material.dart';

import 'custom_notification_widget.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/profile_photo.png'),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: const Color(0xFF949D9E) /* Grayscale-400 */,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: CustomNotificationWidget(),
    );
  }
}

