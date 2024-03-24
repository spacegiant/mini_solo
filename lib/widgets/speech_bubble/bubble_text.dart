import 'package:flutter/cupertino.dart';

import '../../utilities/purify_string_list.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({
    super.key,
    required this.lines,
  });

  final List<String?> lines;

  @override
  Widget build(BuildContext context) {
    List<String> newLines = purifyStringList(lines);
    // END
    List<TextLine> textLines = newLines.map((e) => TextLine(text: e)).toList();
    return Column(children: textLines);
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
