import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gap.dart';

class PopupLayout extends StatelessWidget {
  const PopupLayout({
    super.key,
    required this.header,
    this.body,
    required this.footer,
  });

  final Widget header;
  final Widget? body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
              color: CupertinoColors.black,
            ),
            child: header),
        const Divider(),
        const Gap(),
        Flexible(
          flex: 1,
          child: SingleChildScrollView(
            child: body ?? const SizedBox.shrink(),
          ),
        ),
        const Gap(),
        footer ?? const SizedBox.shrink(),
        CupertinoButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
