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
      children: [
        DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
              color: CupertinoColors.black,
            ),
            child: header),
        const Divider(),
        const Gap(),
        if (body != null) ...[
          body ?? const SizedBox.shrink(),
          const Divider(),
        ],
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
