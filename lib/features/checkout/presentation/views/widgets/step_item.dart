import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/active_step_item.dart';

import 'in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.index,
      required this.stepName,
      required this.isActive});

  final int index;
  final String stepName;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InActiveStepItem(
          index: index,
          stepName: stepName,
        ),
        secondChild: ActiveStepItem(stepName: stepName),
        crossFadeState:
            isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 300));
  }
}
