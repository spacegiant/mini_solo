import 'package:flutter/cupertino.dart';

class ToggleActiveBlock extends StatelessWidget {
  const ToggleActiveBlock(
      {super.key, required this.isActive, required this.child});

  final bool isActive;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: !isActive ? 0.2 : 1.0,
        child: IgnorePointer(
          ignoring: !isActive,
          child: child,
        ));
  }
}
