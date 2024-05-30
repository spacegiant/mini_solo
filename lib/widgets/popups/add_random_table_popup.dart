import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';

import '../../data/app_state.dart';
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
    var count = widget.appState.randomTables.length;
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
                  )
                ],
              ),
            ],
          ),
          const Gap(),
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
                      widget.appState.addRandomTable(RandomTableEntry(
                          isFavourite: false,
                          title: title,
                          rows: convertText(text, _separatorController.text)));
                      _titleController.text = '';
                      _textController.text = '';
                    }
                  }),
              const Gap(),
              CupertinoButton(
                  color: kWarningColour,
                  child: const Text(kLabelClose),
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }

  List<RandomTableRow> convertText(
    //   TODO: Rename to source text
    String text,
    String separator,
  ) {
    List<RandomTableRow> rows = [];
    // convert to array of strings at line break
    // check if more than one line
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(text);
    print(lines.length);

    // If length of 1 return error

    // iterate the lines
    for (int i = 0; i < lines.length; i++) {
      String chanceString;
      // TODO rename chance to weight
      int? chance;
      String myString = lines[i];
      // remove whitespace from ends
      myString = myString.trim();
      // Split at separator
      List<String> split = myString.split(separator);
      // remove white space
      try {
        chanceString = split[0].trim();
        chance = int.parse(chanceString);

        print(chance);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      // Is [0] a number if converted

      // if separator, test if
      rows.add(RandomTableRow(
        title: split.length > 1 ? split[1] : split[0],
        chance: chance ?? 1,
      ));
    }

    // try splitting at the separtor

    return rows;
  }
}
