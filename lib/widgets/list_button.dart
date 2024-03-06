import 'package:flutter/cupertino.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    super.key,
    required this.label,
    required this.handlePress,
  });

  final String label;
  final Function() handlePress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CupertinoButton(
        color: CupertinoColors.systemPink,
        onPressed: handlePress,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0,
        ),
        child: Text(
          label,
        ),
      ),
    );
  }
}
