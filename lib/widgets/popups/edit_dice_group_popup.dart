import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../gap.dart';
import '../my_reorderable_item.dart';
import '../my_reorderable_list_view.dart';

class EditDiceGroupPopup extends StatefulWidget {
  final AppState appState;

  const EditDiceGroupPopup({
    super.key,
    required this.appState,
  });

  @override
  State<EditDiceGroupPopup> createState() => _EditDiceGroupPopupState();
}

class _EditDiceGroupPopupState extends State<EditDiceGroupPopup> {
  late List<String> controls;
  late bool isWrapped;

  @override
  void initState() {
    super.initState();
    isWrapped = widget.appState.wrapDiceControls;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const Text('Edit Group'),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CupertinoSwitch(
                      value: isWrapped,
                      onChanged: (value) {
                        setState(() {
                          isWrapped = !isWrapped;
                        });
                      }),
                  const Text('Wrap controls'),
                ],
              ),
              CupertinoButton(
                  color: kSubmitColor,
                  onPressed: () {
                    // TODO
                    widget.appState.toggleWrapDiceControls(isWrapped);
                    Navigator.pop(context);
                  },
                  child: const Text('Update'))
            ],
          ),
        ],
      ),
    );
  }
}
