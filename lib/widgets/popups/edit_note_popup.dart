import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class EditNotePopup extends StatelessWidget {
  const EditNotePopup({
    super.key,
    required AppState appState,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Column(
      children: [
        Text('Edit Note'),
      ],
    );
  }
}
