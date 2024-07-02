import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupLayout extends StatelessWidget {
  const PopupLayout({
    super.key,
    required this.header,
    this.body,
    required this.footer,
  });

  final Widget header;
  final Widget? body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        const Divider(),
        if (body != null) ...[
          body ?? const SizedBox.shrink(),
          const Divider(),
        ],
        footer,
        CupertinoButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
