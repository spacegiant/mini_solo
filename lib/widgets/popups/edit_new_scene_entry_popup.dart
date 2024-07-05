import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../data/app_state.dart';
import '../gap.dart';

class EditNewSceneEntryPopup extends StatefulWidget {
  const EditNewSceneEntryPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditNewSceneEntryPopup> createState() => _EditNewSceneEntryPopupState();
}

class _EditNewSceneEntryPopupState extends State<EditNewSceneEntryPopup> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    NewSceneEntry entry = widget.appState.campaignData!.newScene
        .firstWhere((entry) => entry.id == widget.id);

    if (_controller.text == '') {
      setState(() {
        _controller.text = entry.label;
      });
    }

    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Edit Scene Marker'),
      body: CupertinoTextField(controller: _controller),
      footer: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CupertinoButton(
              color: CupertinoColors.systemGreen,
              onPressed: () {
                widget.appState.updateNewScene(widget.id, _controller.text);
                // widget.appState.setCurrentEntryId('');
                // Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
            const Gap(),
            CupertinoButton(
              color: CupertinoColors.destructiveRed,
              onPressed: () {
                widget.appState.deleteNewSceneEntry(widget.id);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ]),
        ],
      ),
    );
  }
}
