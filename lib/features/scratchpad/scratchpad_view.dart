import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
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
        ScratchPageEntryItem? scratch =
            appState.findScratchPadEntryItem(currentScratchId);
        _titleController.text = scratch!.title;
        _textController.text = scratch.text;
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Scratchpad ${appState.currentScratchId}'),
          const Divider(),
          ScratchList(
            scratchItems: scratchEntriesData,
            callback: (String id) {
              appState.setCurrentScratchId(id);
            },
          ),
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

class ScratchList extends StatelessWidget {
  final List<ScratchPageEntryItem> scratchItems;
  final Function(String) callback;
  const ScratchList({
    super.key,
    required this.scratchItems,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    List<ScratchListItem> scratchListData = scratchItems
        .map(
          (entry) => ScratchListItem(
            entry,
            callback: callback,
          ),
        )
        .toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 10.0,
        maxHeight: 100.0,
      ),
      child: ListView(
        children: scratchListData,
      ),
    );
  }
}

class ScratchListItem extends StatelessWidget {
  final ScratchPageEntryItem entry;
  final Function(String) callback;

  const ScratchListItem(
    this.entry, {
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: Alignment.centerLeft,
      child: Text(entry.title),
      onPressed: () {
        print('pressed');
        callback(entry.id);
      },
    );
  }
}
