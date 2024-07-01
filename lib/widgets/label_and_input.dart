import 'package:flutter/cupertino.dart';

import 'gap.dart';

class LabelAndInput extends StatelessWidget {
  const LabelAndInput({
    super.key,
    required this.label,
    this.enabled,
    required this.controller,
    required this.onChanged,
  });

  final String label;
  final bool? enabled;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
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
}
