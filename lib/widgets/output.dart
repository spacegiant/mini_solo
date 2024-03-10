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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: TextBubble(
              newString: text.join('\n'),
            ),
          ),
          const Positioned(
            bottom: -18.0,
            child: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  CupertinoIcons.triangle_fill,
                  color: CupertinoColors.systemPurple,
                )),
          ),
        ],
      ),
    );
  }
}

class TextBubble extends StatelessWidget {
  const TextBubble({
    super.key,
    required this.newString,
  });

  final String newString;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 200.0),
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: CupertinoColors.systemPurple,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: MarkdownBlock(newString: newString));
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
        textScaler: const TextScaler.linear(1.5),
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
