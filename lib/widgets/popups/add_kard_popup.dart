import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../data/app_state.dart';
import '../../features/kard/kard.dart';
import '../gap.dart';

class AddKardPopup extends StatefulWidget {
  const AddKardPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

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
    return PopupLayout(
        header: const PopupLayoutHeader(label: 'Add Card'),
        body: Column(
          children: [
            CupertinoTextField(
              controller: _titleController,
            ),
            const Gap(),
            CupertinoTextField(
              // expands: true,
              maxLines: 3,
              controller: _linesController,
            ),
          ],
        ),
        footer: CupertinoButton(
          color: CupertinoColors.systemPink,
          onPressed: () {
            String text = _titleController.value.text.trim();
            if (text == '' && _linesController.text.trim().isEmpty) return;
            widget.appState.createNewLabel(Kard(
              title: text,
              lines: convertToLines(_linesController.value.text),
              // TODO user can set this
              labelLayout: KardLayoutTypes.horizontal,
            ));
            _titleController.text = '';
          },
          child: const Text('Add'),
        ));
  }

  List<String> convertToLines(String lines) {
    LineSplitter ls = const LineSplitter();
    List<String> separated = ls.convert(lines);

    return separated.map((line) => line.trim()).toList();
  }
}
