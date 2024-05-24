import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteEntryInput extends StatelessWidget {
  const NoteEntryInput({
    super.key,
    required TextEditingController controller,
    required this.onInputSubmit,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Function() onInputSubmit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoTextField(
          controller: _controller,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: Colors.transparent,
          ),
          placeholder: 'Type here',
          autofocus: true,
          expands: true,
          minLines: null,
          maxLines: null,
        ),
        Positioned(
            right: 0.0,
            bottom: 0.0,
            child: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: onInputSubmit,
                child: const Icon(CupertinoIcons.add_circled_solid)))
      ],
    );
  }
}
