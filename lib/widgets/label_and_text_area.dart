import 'package:flutter/cupertino.dart';

import 'gap.dart';

class LabelAndTextArea extends StatelessWidget {
  const LabelAndTextArea({
    super.key,
    required this.label,
    this.enabled = true,
    required this.controller,
    required this.onChanged,
    this.axis = Axis.vertical,
    this.autoFocus = false,
  });

  final String label;
  final bool? enabled;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final Axis axis;
  final bool autoFocus;

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
            maxLines: 5,
            minLines: 5,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const Gap(
          height: 6.0,
        ),
        CupertinoTextField(
          maxLines: 5,
          minLines: 5,
          autofocus: autoFocus,
          onChanged: onChanged,
          controller: controller,
          enabled: enabled ?? false,
        ),
      ],
    );
  }
}
