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

      // if no notes, start a new one put in state

      String currentScratchId = appState.currentScratchId;
      print('current scratch id = $currentScratchId');

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
          CupertinoTextField.borderless(
            textAlignVertical: TextAlignVertical.top,
            placeholder: 'Title here',
            controller: _titleController,
            expands: true,
            minLines: null,
            maxLines: null,
            textCapitalization: TextCapitalization.sentences,
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
                    print('create new');
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
                    print('save or update to data');
                    ScratchPageEntryItem scratch = ScratchPageEntryItem(
                      isFavourite: false,
                      title: _titleController.text,
                      text: _textController.text,
                      dateCreated: DateTime.now(),
                    );
                    if (appState.currentScratchId == '') {
                      appState.addScratchPadEntry(scratch);
                    } else {
                      // appState.updateScratchPadEntryItem(, detail)
                    }
                  },
                  child: const Text('Finish'),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
