import 'package:flutter/cupertino.dart';

class LabelAndSwitch extends StatelessWidget {
  const LabelAndSwitch({
    super.key,
    required this.label,
    required this.onChanged,
    required this.switchValue,
  });
  final String label;
  final Function(bool) onChanged;
  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(value: true, onChanged: onChanged),
        Text(label),
      ],
    );
  }
}
