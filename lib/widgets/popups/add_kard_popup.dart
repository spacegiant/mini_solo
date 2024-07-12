import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../features/grouping/group-picker.dart';
import '../../features/kard/kard.dart';
import '../gap.dart';
import '../label_and_picker.dart';

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
  late String selectedGroup = 'unsorted';
  late String originalGroup = 'unsorted';
  late String? groupId;
  Kard? entry;
  int currentLayoutTypeIndex = 0;
  List<String> layoutTypeOptions = [];
  List<KardLayoutTypes> layoutTypeIds = [];

  @override
  void initState() {
    super.initState();
    String initTitle = '';
    String initLines = '';
    kardLayouts.forEach((k, v) {
      layoutTypeOptions.add(v.label);
      layoutTypeIds.add(k);
    });

    if (widget.id != null) {
      selectedGroup = widget.appState.findCurrentGroupId(widget.id!)!;
      originalGroup = selectedGroup;
      entry = widget.appState.getKardById(widget.id!);
      if (entry != null) {
        initTitle = entry!.title;
        initLines = entry!.lines!.join('\n');
        currentLayoutTypeIndex =
            layoutTypeIds.indexWhere((type) => type == entry?.layoutType);
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
          Text(entry?.layoutType.toString() ?? ''),
          CupertinoTextField(
            controller: _titleController,
          ),
          const Gap(),
          CupertinoTextField(
            // expands: true,
            maxLines: 3,
            controller: _linesController,
          ),
          LabelAndPicker(
            label: 'Layout type',
            items: layoutTypeOptions,
            onChange: (index) {
              if (index != null) {
                currentLayoutTypeIndex = index;
              }
            },
            initialItem: currentLayoutTypeIndex,
          ),
          GroupPicker(
            onChange: (string) {
              setState(() {
                selectedGroup = string;
              });
            },
            appState: widget.appState,
            initialGroupId: selectedGroup,
          ),
        ],
      ),
      footer: Row(
        children: [
          CupertinoButton(
            color: kSubmitColor,
            onPressed: () {
              String? controlId;
              String text = _titleController.value.text.trim();
              if (text == '' && _linesController.text.trim().isEmpty) return;

              List<String> lines = convertToLines(_linesController.value.text);

              if (widget.id != null) {
                widget.appState.updateKard(
                  id: widget.id!,
                  title: text,
                  lines: lines,
                  layoutType: layoutTypeIds[currentLayoutTypeIndex],
                );
                controlId = widget.id;
              } else {
                print(layoutTypeIds[currentLayoutTypeIndex]);
                Kard newKard = Kard(
                  title: text,
                  lines: convertToLines(_linesController.value.text),
                  layoutType: layoutTypeIds[currentLayoutTypeIndex],
                );
                widget.appState.createNewKard(newKard);
                controlId = newKard.id;
              }

              _titleController.text = '';
              _linesController.text = '';

              // IF GROUP DIFFERENT
              if (controlId != null && originalGroup != selectedGroup) {
                widget.appState
                    .moveToGroup(controlId: controlId, groupId: selectedGroup);
              }

              Navigator.pop(context);
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
