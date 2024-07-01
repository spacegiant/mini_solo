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
    this.defunctLabel,
    required this.initialIndex,
  });

  final String label;
  final bool? enabled;
  final List<String> items;
  final Function(int?) onChange;
  final String? defunctLabel;
  final int? initialIndex;

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
            defunctLabel: defunctLabel,
            items: items,
            onChange: onChange,
            enabled: enabled ?? false,
            initialIndex: initialIndex,
            selectedItemIndex: 0,
          ),
        ),
      ],
    );
  }
}
