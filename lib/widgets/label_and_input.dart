import 'package:flutter/cupertino.dart';

import 'gap.dart';

class LabelAndInput extends StatelessWidget {
  const LabelAndInput({
    super.key,
    required this.label,
    this.enabled = true,
    required this.controller,
    required this.onChanged,
    this.axis = Axis.vertical,
  });

  final String label;
  final bool? enabled;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.vertical) {
      return verticalLayout();
    } else {
      return horizontalLayout();
    }
  }

  Row horizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        const Gap(),
        Flexible(
          child: CupertinoTextField(
            onChanged: onChanged,
            controller: controller,
            enabled: enabled ?? false,
          ),
        ),
      ],
    );
  }

  Column verticalLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        CupertinoTextField(
          onChanged: onChanged,
          controller: controller,
          enabled: enabled ?? false,
        ),
      ],
    );
  }
}
