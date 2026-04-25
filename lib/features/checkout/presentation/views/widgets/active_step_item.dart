import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.stepName});
  final String stepName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 5),
         Text(
          stepName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}




