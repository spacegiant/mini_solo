import 'dart:convert';

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
  late TextEditingController _titleController;
  late TextEditingController _linesController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _linesController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _linesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Add Card'),
      const Divider(),
      CupertinoTextField(
        controller: _titleController,
      ),
      CupertinoTextField(
        // expands: true,
        maxLines: 3,
        controller: _linesController,
      ),
      const Gap(),
      CupertinoButton(
        color: CupertinoColors.systemPink,
        onPressed: () {
          String text = _titleController.value.text.trim();
          if (text == '') return;
          widget.appState.createNewLabel(Kard(
            title: text,
            lines: convertToLines(_linesController.value.text),
            controlType: ControlTypeEnum.kard,
          ));
          _titleController.text = '';
        },
        child: const Text('Add'),
      )
    ]);
  }

  List<String> convertToLines(String lines) {
    LineSplitter ls = const LineSplitter();
    List<String> separated = ls.convert(lines);

    return separated.map((line) => line.trim()).toList();
  }
}
