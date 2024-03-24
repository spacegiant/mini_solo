import 'package:flutter/cupertino.dart';

class SpeechBubble extends StatelessWidget {
  const SpeechBubble({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Bubble(widget: widget),
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
    required this.widget,
  });

  final Widget widget;

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
      child: widget,
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
