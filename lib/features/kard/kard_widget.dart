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
    List<Widget> textLines =
        entry.lines?.map((line) => Text(line)).toList() ?? [];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(kInputBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(entry.title),
            ...textLines,
          ],
        ),
      ),
    );
  }
}
