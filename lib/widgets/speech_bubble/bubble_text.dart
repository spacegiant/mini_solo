import 'package:flutter/cupertino.dart';

import '../../utilities/purify_string_list.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({
    super.key,
    required this.lines,
    required this.type,
  });

  final List<String?> lines;
  final String type;

  @override
  Widget build(BuildContext context) {
    List<String> newLines = purifyStringList(lines);
    List<TextLine> textLines = newLines.map((e) => TextLine(text: e)).toList();
    return Column(children: [Text(type), ...textLines]);
  }
}

class TextLine extends StatelessWidget {
  const TextLine({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        color: CupertinoColors.white,
      ),
    );
  }
}
