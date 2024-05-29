import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
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
            children: [
              const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: kSubmitColour,
              ),
              const Gap(),
              Text('Validation $count'),
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
                        lines: convertText(text),
                      ));
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

  convertText(String text) {
    // convert to array of strings at line break
    // check if more than one line
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(text);

    return lines;
  }
}
