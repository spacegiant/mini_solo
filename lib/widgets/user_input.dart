import 'package:flutter/cupertino.dart';

class UserInput extends StatefulWidget {
  const UserInput({
    super.key,
  });

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
          width: 1.0,
          color: CupertinoColors.systemGrey,
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Column(
          children: [
            CupertinoTextField(
              controller: _textController,
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.multiline,
              placeholder: 'Type here',
              maxLines: 5,
              minLines: 2,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
            ),
            CupertinoButton(
              child: const Text('Submit'),
              onPressed: () {
                print(_textController.text);

                _textController.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
