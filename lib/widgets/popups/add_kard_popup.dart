import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../constants.dart';
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
    String initTitle = '';
    String initLines = '';
    if (widget.id != null) {
      Kard? entry = widget.appState.getKardById(widget.id!);
      if (entry != null) {
        initTitle = entry.title;
        initLines = entry.lines!.join('\n');
      }
    }
    _titleController = TextEditingController(text: initTitle);
    _linesController = TextEditingController(text: initLines);
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
      footer: Row(
        children: [
          CupertinoButton(
            color: kSubmitColor,
            onPressed: () {
              String text = _titleController.value.text.trim();
              if (text == '' && _linesController.text.trim().isEmpty) return;
              widget.appState.createNewLabel(
                Kard(
                  title: text,
                  lines: convertToLines(_linesController.value.text),
                  // TODO user can set this
                  labelLayout: KardLayoutTypes.horizontal,
                ),
              );
              _titleController.text = '';
            },
            child: Text(widget.id == null ? 'Add' : 'Update'),
          ),
          if (widget.id != null) ...[
            const Gap(),
            CupertinoButton(
              color: kWarningColor,
              onPressed: () {
                widget.appState.deleteKard(widget.id!);
                Navigator.pop(context);
              },
              child: const Text(kDeleteLabel),
            ),
          ]
        ],
      ),
    );
  }

  List<String> convertToLines(String lines) {
    LineSplitter ls = const LineSplitter();
    List<String> separated = ls.convert(lines);

    return separated.map((line) => line.trim()).toList();
  }
}
