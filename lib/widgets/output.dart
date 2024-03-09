import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Output extends StatelessWidget {
  const Output({
    super.key,
    required this.text,
  });

  final List<String> text;

  @override
  Widget build(BuildContext context) {
    String newString = text.join('\n');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: CupertinoColors.systemPurple,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: MarkdownBlock(newString: newString)),
    );
  }
}

class MarkdownBlock extends StatelessWidget {
  const MarkdownBlock({
    super.key,
    required this.newString,
  });

  final String newString;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      softLineBreak: true,
      styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
      styleSheet: MarkdownStyleSheet(
        p: const TextStyle(
          color: CupertinoColors.white,
        ),
        em: const TextStyle(
          color: CupertinoColors.white,
        ),
      ),
      data: newString,
    );
  }
}
