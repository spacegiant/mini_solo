import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/result_entries.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../features/action_lists/edit_result_popup.dart';
import '../../gap.dart';
import '../../popups/toggle_show_popup.dart';

class JournalEntryWidgetWrapper extends StatelessWidget {
  const JournalEntryWidgetWrapper({
    super.key,
    required this.children,
    this.onLongPress,
    this.onTap,
    this.note = '',
  });

  final List<Widget> children;
  final Function()? onLongPress;
  final Function()? onTap;
  final String? note;

  @override
  Widget build(BuildContext context) {
    bool hasANote = note != '';
    List<Widget> noteWidget = hasANote
        ? [
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
                  child: Text(note ?? ''),
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
          ]
        : [];

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...children,
            ...noteWidget,
          ],
        ),
      ),
    );
  }
}
