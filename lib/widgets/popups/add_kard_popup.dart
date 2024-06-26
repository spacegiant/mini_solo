import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';

import '../../data/app_state.dart';
import '../../features/kard/kard.dart';
import '../gap.dart';

class AddKardPopup extends StatefulWidget {
  const AddKardPopup({super.key, required this.appState});

  final AppState appState;

  @override
  State<AddKardPopup> createState() => _AddKardPopupState();
}

class _AddKardPopupState extends State<AddKardPopup> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Add Card'),
      const Divider(),
      CupertinoTextField(
        controller: _controller,
      ),
      const Gap(),
      CupertinoButton(
        color: CupertinoColors.systemPink,
        onPressed: () {
          String text = _controller.value.text.trim();
          if (text == '') return;
          // widget.appState.createNewGroup(
          //   Group(groupId: genericId('group'), label: text, controls: []),
          // );
          widget.appState.createNewLabel(
              Kard(title: text, controlType: ControlTypeEnum.kard));
          _controller.text = '';
        },
        child: const Text('Add'),
      )
    ]);
  }
}
