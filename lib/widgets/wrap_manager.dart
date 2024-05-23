import 'package:flutter/material.dart';

class WrapManager extends StatelessWidget {
  const WrapManager({
    super.key,
    required this.wrapControls,
    required this.children,
  });

  final bool wrapControls;
  final List<Widget> children;

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
              const Divider(),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
            ),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 4.0,
                  children: children,
                )),
          );

    return widget;
  }
}
