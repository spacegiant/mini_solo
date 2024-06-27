import 'package:flutter/cupertino.dart';

import 'gap.dart';
import 'picker.dart';

class LabelAndPicker extends StatelessWidget {
  const LabelAndPicker({
    super.key,
    required this.label,
    this.enabled,
    required this.items,
    required this.onChange,
  });

  final String label;
  final bool? enabled;
  final List<String> items;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        const Gap(),
        // TODO Change this to some sort of Filter List
        Flexible(
          child: Picker(
            items: items,
            onChange: onChange,
            enabled: enabled ?? false,
          ),
        ),
      ],
    );
  }
}
