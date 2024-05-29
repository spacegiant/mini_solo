import 'package:flutter/material.dart';

class WrapManager extends StatelessWidget {
  const WrapManager({
    super.key,
    required this.wrapControls,
    required this.children,
    this.hideDivider = false,
  });

  final bool wrapControls;
  final List<Widget> children;
  final bool hideDivider;

  @override
  Widget build(BuildContext context) {
    Widget widget = wrapControls == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 4.0,
                children: children,
              ),
              if (hideDivider != true) const Divider(),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 4.0,
              children: children,
            ));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget,
    );
  }
}
