import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/widgets/picker.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group-picker.dart';
import '../../features/grouping/group.dart';
import '../gap.dart';

class AddRandomTablePopup extends StatefulWidget {
  const AddRandomTablePopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<AddRandomTablePopup> createState() => _AddRandomTablePopupState();
}

class _AddRandomTablePopupState extends State<AddRandomTablePopup> {
  late TextEditingController _titleController;
  late TextEditingController _textController;
  late TextEditingController _separatorController;

  final String separatorCharacter = '|';
  String selectedGroup = 'unsorted';

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _textController = TextEditingController();
    _separatorController = TextEditingController(text: separatorCharacter);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    _separatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = widget.appState.randomTables.length;
    List<Group> groupList = widget.appState.groupList;
    List<String> listOfGroups = groupList.map((group) => group.label).toList();
    var groupIndex =
        groupList.indexWhere((group) => group.groupId == 'group-random-tables');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text(
            kRandomTablePopupTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          const Gap(),
          CupertinoTextField(
            controller: _titleController,
            textAlignVertical: TextAlignVertical.top,
            placeholder: kLabelEnterFilename,
            clearButtonMode: OverlayVisibilityMode.editing,
          ),
          SingleChildScrollView(
            child: CupertinoTextField(
              controller: _textController,
              textAlignVertical: TextAlignVertical.top,
              placeholder: kLabelTypePasteHere,
              minLines: 10,
              maxLines: 10,
              clearButtonMode: OverlayVisibilityMode.editing,
            ),
          ),
          const Gap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: kSubmitColour,
                  ),
                  const Gap(),
                  Text('Validation $count'),
                ],
              ),
              Row(
                children: [
                  const Text('Separator:'),
                  const Gap(),
                  SizedBox(
                    width: 40.0,
                    child: CupertinoTextField(
                      textAlign: TextAlign.center,
                      controller: _separatorController,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GroupPicker(
            listOfGroups: listOfGroups,
            groupIndex: groupIndex,
            onChange: (string) {
              setState(() {
                selectedGroup = string;
              });
            },
            appState: widget.appState,
          ),
          Row(
            children: [
              CupertinoButton(
                  color: kSubmitColour,
                  child: const Text(kLabelAdd),
                  onPressed: () {
                    String title = _titleController.text;
                    String text = _textController.text;
                    // TODO: Better validation here with user feedback

                    if (title != '' && text != '') {
                      List<RandomTableRow> myText =
                          convertText(text, _separatorController.text);

                      RandomTableEntry entry = RandomTableEntry(
                        isFavourite: false,
                        title: title,
                        rows: myText,
                      );

                      widget.appState.addRandomTable(entry);
                      _titleController.text = '';
                      _textController.text = '';
                      widget.appState.addToGroup(
                          controlId: entry.id, groupId: selectedGroup);
                    }
                  }),
              const Gap(),
              CupertinoButton(
                  color: kWarningColour,
                  child: const Text(kLabelClose),
                  onPressed: () {
                    widget.appState.closePopup();
                  }),
            ],
          )
        ],
      ),
    );
  }

  List<RandomTableRow> convertText(
    String sourceText,
    String separator,
  ) {
    List<RandomTableRow> rows = [];
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(sourceText);

    for (int i = 0; i < lines.length; i++) {
      String weightString;
      int? weight;
      String myString = lines[i];
      myString = myString.trim();
      List<String> split = myString.split(separator);

      try {
        weightString = split[0].trim();
        weight = int.parse(weightString);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      rows.add(RandomTableRow(
        label: split.length > 1 ? split[1] : split[0],
        weight: weight ?? 1,
      ));
    }

    return rows;
  }
}
