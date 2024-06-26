import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'kard.dart';

class KardWidget extends StatelessWidget {
  const KardWidget({
    super.key,
    required this.entry,
  });

  final Kard entry;

  @override
  Widget build(BuildContext context) {
    List<Widget> textLines = entry.lines
            ?.map((line) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    line,
                    style: TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                ))
            .toList() ??
        [];
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100.0,
        minHeight: 44.0,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(kInputBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        entry.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white),
                      ),
                    ),
                    if (textLines.isNotEmpty)
                      const Divider(
                        color: Color(0x44FFFFFF),
                      ),
                    ...textLines,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
