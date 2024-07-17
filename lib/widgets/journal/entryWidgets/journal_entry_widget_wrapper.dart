import 'package:flutter/cupertino.dart';
import '../../../data/app_state.dart';
import '../../gap.dart';

class JournalEntryWidgetWrapper extends StatelessWidget {
  const JournalEntryWidgetWrapper({
    super.key,
    required this.children,
    this.onLongPress,
    this.onTap,
    this.note = '',
    required this.appState,
  });

  final List<Widget> children;
  final Function()? onLongPress;
  final Function()? onTap;
  final String? note;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    bool showNote = appState.showNotes == true && note != '';
    print(showNote);
    List<Widget> noteWidget;
    if (showNote) {
      noteWidget = [
        const Gap(
          height: 16.0,
        ),
        Stack(clipBehavior: Clip.none, children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100.0,
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: CupertinoColors.white,
              child: Text(
                note ?? '',
              ),
            ),
          ),
          const Positioned(
            top: -16,
            left: 4.0,
            child: Icon(
              CupertinoIcons.arrowtriangle_up_fill,
              color: CupertinoColors.white,
            ),
          ),
        ])
      ];
    } else {
      noteWidget = [];
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...children,
            ...noteWidget,
          ],
        ),
      ),
    );
  }
}
