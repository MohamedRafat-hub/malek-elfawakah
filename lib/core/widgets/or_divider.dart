import 'package:flutter/material.dart';

import 'custom_text.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(child: Divider()),
        CustomText(text: 'أو', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0C0D0D)),
        Expanded(child: Divider()),
      ],
    );
  }
}
