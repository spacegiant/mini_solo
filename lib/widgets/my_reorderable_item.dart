import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/app_state.dart';

class MyReorderableItem extends StatefulWidget {
  const MyReorderableItem({
    super.key,
    required this.id,
    required this.appState,
    required this.label,
    this.selected,
    this.onTap,
    required this.index,
  });

  final String id;
  final String label;
  final AppState appState;
  final bool? selected;
  final Function()? onTap;
  final int index;

  @override
  State<MyReorderableItem> createState() => _MyReorderableItemState();
}

class _MyReorderableItemState extends State<MyReorderableItem> {
  late bool isActive;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isActive = widget.appState.getGroup(widget.id).isActive ?? false;
  }

  @override
  Widget build(BuildContext context) {
    bool? isActive = widget.appState.getGroup(widget.id).isActive;
    return ReorderableDelayedDragStartListener(
      index: widget.index,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 60.0,
          color: widget.selected == true ? Colors.yellow : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(widget.label)),
                Row(
                  children: [
                    CupertinoButton(
                        child: isActive == true
                            ? const Icon(CupertinoIcons.eye)
                            : const Icon(
                                CupertinoIcons.eye_slash,
                                color: CupertinoColors.inactiveGray,
                              ),
                        onPressed: () {
                          widget.appState.toggleGroupIsActive(widget.id);
                          setState(() {
                            isActive =
                                widget.appState.getGroup(widget.id).isActive;
                          });
                        }),
                    const Icon(
                      CupertinoIcons.line_horizontal_3,
                      size: 20.0,
                      color: CupertinoColors.systemGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // child: ListTile(
      //   title: Text(label),
      //   trailing: const Row(
      //     children: [
      //       Icon(
      //         CupertinoIcons.line_horizontal_3,
      //         size: 20.0,
      //         color: CupertinoColors.systemGrey,
      //       ),
      //     ],
      //   ),
      //   selected: selected ?? false,
      //   onTap: onTap,
      //   // tileColor: CupertinoColors.systemGrey5,
      //   // selectedColor: CupertinoColors.black,
      //   selectedTileColor: CupertinoColors.systemYellow,
      // ),
    );
  }
}
