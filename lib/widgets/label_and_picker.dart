import 'package:flutter/cupertino.dart';

import 'gap.dart';
import 'picker.dart';

class LabelAndPicker extends StatefulWidget {
  const LabelAndPicker({
    super.key,
    required this.label,
    this.enabled = true,
    required this.items,
    required this.onChange,
    this.defunctLabel,
  });

  final String label;
  final bool? enabled;
  final List<String> items;
  final Function(int?) onChange;
  final String? defunctLabel;

  @override
  State<LabelAndPicker> createState() => _LabelAndPickerState();
}

class _LabelAndPickerState extends State<LabelAndPicker> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.label),
        const Gap(),
        // TODO Change this to some sort of Filter List
        Flexible(
          child: Picker(
            defunctLabel: widget.defunctLabel,
            items: widget.items,
            onChange: widget.onChange,
            enabled: widget.enabled ?? false,
            selectedIndex: selectedIndex,
            selectedItemIndex: 0,
          ),
        ),
      ],
    );
  }
}
