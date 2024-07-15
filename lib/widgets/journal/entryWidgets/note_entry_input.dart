import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteEntryInput extends StatefulWidget {
  const NoteEntryInput({
    super.key,
    required TextEditingController controller,
    required this.onInputSubmit,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Function() onInputSubmit;

  @override
  State<NoteEntryInput> createState() => _NoteEntryInputState();
}

class _NoteEntryInputState extends State<NoteEntryInput> {
  late bool isUsingPhysicalKeyboard = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CallbackShortcuts(
          bindings: {
            const SingleActivator(
              LogicalKeyboardKey.enter,
              meta: true,
            ): () {
              widget.onInputSubmit();
            }
          },
          child: CupertinoTextField(
            textInputAction: isUsingPhysicalKeyboard == true
                ? TextInputAction.done
                : TextInputAction.newline,
            controller: widget._controller,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Colors.transparent,
            ),
            onSubmitted: (value) {
              widget.onInputSubmit();
            },
            placeholder: 'Type here',
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            expands: true,
            minLines: null,
            maxLines: null,
          ),
        ),
        // KeyboardListener(
        //   focusNode: FocusNode(),
        //   onKeyEvent: (keyEvent) {
        //     setState(
        //       () {
        //         isUsingPhysicalKeyboard = true;
        //       },
        //     );
        //   },
        //   child: CupertinoTextField(
        //     textInputAction: isUsingPhysicalKeyboard == true
        //         ? TextInputAction.done
        //         : TextInputAction.newline,
        //     controller: widget._controller,
        //     decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.zero,
        //       color: Colors.transparent,
        //     ),
        //     onSubmitted: (value) {
        //       widget.onInputSubmit();
        //     },
        //     placeholder: 'Type here',
        //     textCapitalization: TextCapitalization.sentences,
        //     autofocus: true,
        //     expands: true,
        //     minLines: null,
        //     maxLines: null,
        //   ),
        // ),
        Positioned(
            right: 0.0,
            bottom: 0.0,
            child: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: widget.onInputSubmit,
                child: const Icon(CupertinoIcons.add_circled_solid)))
      ],
    );
  }
}
