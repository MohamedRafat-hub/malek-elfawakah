import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/widgets/custom_text.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key , required this.title , required this.icon ,  this.onPressed});
  final String title;
  final String icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Color(0xFFDDDFDF),
              width: 1,
            )
          )
        ),
        onPressed: onPressed,

        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity
          ),
          leading: SvgPicture.asset(icon),
          title: Text(title, style: TextStyle(
            color: Color(0xFF0C0D0D),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
