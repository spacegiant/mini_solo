import 'package:flutter/cupertino.dart';

class TextOutput extends StatelessWidget {
  const TextOutput({
    super.key,
    required this.line1,
    this.line2,
    this.line3,
  });

  final String line1;
  final String? line2;
  final String? line3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: Bubble(
              line1: line1,
              line2: line2,
              line3: line3,
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

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    required this.line1,
    this.line2,
    this.line3,
  });

  final String line1;
  final String? line2;
  final String? line3;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200.0,
        minHeight: 100.0,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: CupertinoColors.systemPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      // child: MarkdownBlock(newString: newString));
      child: BubbleText(
        lines: [
          BubbleTextLine(text: line1),
          line2 != null
              ? BubbleTextLine(text: line2!)
              : const SizedBox.shrink(),
          line3 != null
              ? BubbleDetailLine(text: line3!)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class BubbleText extends StatelessWidget {
  const BubbleText({
    super.key,
    required this.lines,
  });

  final List<Widget> lines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...lines],
    );
  }
}

class BubbleDetailLine extends StatelessWidget {
  const BubbleDetailLine({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16.0,
        color: CupertinoColors.white,
      ),
    );
  }
}

class BubbleTextLine extends StatelessWidget {
  const BubbleTextLine({
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
//
// class MarkdownBlock extends StatelessWidget {
//   const MarkdownBlock({
//     super.key,
//     required this.newString,
//   });
//
//   final String newString;
//
//   @override
//   Widget build(BuildContext context) {
//     return MarkdownBody(
//       softLineBreak: true,
//       styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
//       styleSheet: MarkdownStyleSheet(
//         textScaler: const TextScaler.linear(1.5),
//         p: const TextStyle(
//           color: CupertinoColors.white,
//         ),
//         em: const TextStyle(
//           color: CupertinoColors.white,
//         ),
//       ),
//       data: newString,
//     );
//   }
// }
