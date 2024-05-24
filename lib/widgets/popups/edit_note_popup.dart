import 'dart:io';

import 'package:flutter/cupertino.dart';

class EditNotePopup extends StatefulWidget {
  const EditNotePopup({
    super.key,
  });

  @override
  State<EditNotePopup> createState() => _EditNotePopupState();
}

class _EditNotePopupState extends State<EditNotePopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return const Text('Edit Note');
  }
}
