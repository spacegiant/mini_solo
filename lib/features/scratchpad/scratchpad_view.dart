import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/features/scratchpad/scratch_list.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';

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
            child: Text('Scratchpad'),
          ),
          const Divider(),
          ScratchList(
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
            placeholder: 'Title here',
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
              placeholder: '...',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  color: Colors.blue,
                  onPressed: () {
                    _titleController.text = '';
                    _textController.text = '';
                    appState.setCurrentScratchId('');
                  },
                  child: const Text('New'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CupertinoButton(
                  color: Colors.green,
                  onPressed: () {
                    DateTime dateTime = DateTime.now();

                    if (_titleController.text == '') {
                      _titleController.text =
                          createDateLabel('scratch', dateTime);
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
                  child: const Text('Save'),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  String createDateLabel(String prefix, DateTime dateTime) {
    String day = dateTime.day.toString();
    String month = dateTime.day.toString();
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString();
    String minutes = dateTime.minute.toString();

    return '$prefix-$day-$month-$year@$hour.$minutes';
  }
}
