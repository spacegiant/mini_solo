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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoTextField.borderless(
        placeholder: '...',
        controller: _controller,
        expands: true,
        minLines: null,
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}
