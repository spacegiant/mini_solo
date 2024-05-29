import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/features/scratchpad/scratch_picker.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';
import '../../utilities/create_date_label.dart';

class ScratchpadView extends StatefulWidget {
  const ScratchpadView({
    super.key,
  });

  @override
  State<ScratchpadView> createState() => _ScratchpadViewState();
}

class _ScratchpadViewState extends State<ScratchpadView> {
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
    return Consumer<AppState>(builder: (context, appState, child) {
      // get all the notes
      List<ScratchPageEntryItem> scratchEntriesData =
          appState.campaignData!.scratchPad;

      String currentScratchId = appState.currentScratchId;

      if (currentScratchId != '') {
        try {
          ScratchPageEntryItem? scratch =
              appState.findScratchPadEntryItem(currentScratchId);
          _titleController.text = scratch!.title;
          _textController.text = scratch.text;
        } catch (e) {
          appState.setCurrentScratchId('');
          print(e);
        }
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(kScratchPadTitle),
          ),
          const Divider(),
          ScratchPicker(
              scratchItems: scratchEntriesData,
              onSelect: (String id) {
                appState.setCurrentScratchId(id);
              },
              onDelete: (String id) {
                appState.deleteScratchPadEntry(id);
              }),
          const Divider(),
          CupertinoTextField.borderless(
            textAlignVertical: TextAlignVertical.top,
            placeholder: kScratchTitlePlaceholder,
            controller: _titleController,
            expands: true,
            minLines: null,
            maxLines: null,
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: CupertinoTextField.borderless(
              textAlignVertical: TextAlignVertical.top,
              placeholder: kScratchTextPlaceholder,
              controller: _textController,
              autofocus: true,
              expands: true,
              minLines: null,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                newScratchButton(appState),
                const SizedBox(width: 10.0),
                scratchpadSaveButton(appState),
              ],
            ),
          )
        ],
      );
    });
  }

  CupertinoButton newScratchButton(AppState appState) {
    return CupertinoButton(
      color: Colors.blue,
      onPressed: () {
        _titleController.text = '';
        _textController.text = '';
        appState.setCurrentScratchId('');
      },
      child: const Text(kScratchPadNew),
    );
  }

  CupertinoButton scratchpadSaveButton(AppState appState) {
    return CupertinoButton(
      color: Colors.green,
      onPressed: () {
        if (_textController.text == '') return;

        DateTime dateTime = DateTime.now();

        if (_titleController.text == '') {
          _titleController.text =
              createDateLabel(kScratchDateLabelPrefix, dateTime);
        }

        if (appState.currentScratchId == '') {
          ScratchPageEntryItem scratch = ScratchPageEntryItem(
            isFavourite: false,
            title: _titleController.text,
            text: _textController.text,
            dateCreated: dateTime,
          );

          appState.addScratchPadEntry(scratch);
        } else {
          appState.updateScratchPadEntryItem(
            id: appState.currentScratchId,
            title: _titleController.text,
            text: _textController.text,
          );
        }
      },
      child: const Text(kScratchPadSave),
    );
  }
}
