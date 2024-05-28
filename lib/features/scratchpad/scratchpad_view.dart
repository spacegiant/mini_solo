import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Scratchpad'),
          const Divider(),
          Expanded(
            child: CupertinoTextField.borderless(
              textAlignVertical: TextAlignVertical.top,
              placeholder: '...',
              controller: _controller,
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
                  onPressed: () {},
                  child: const Text('New'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CupertinoButton(
                  color: Colors.green,
                  onPressed: () {},
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
