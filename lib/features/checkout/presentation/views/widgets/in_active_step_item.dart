import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.stepName});
  final int index;
  final String stepName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Color(0xFFF2F3F3),
          child:  Text(
            '$index',
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Gap(5),
        Text(
          stepName,
          style: TextStyle(
            color: const Color(0xFFAAAAAA),
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            height: 1.70,
          ),
        )
      ],
    );
  }
}