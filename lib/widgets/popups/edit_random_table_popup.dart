import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../data/note_entry_item.dart';
import '../gap.dart';

class EditRandomTable extends StatefulWidget {
  const EditRandomTable({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditRandomTable> createState() => _EditRandomTableState();
}

class _EditRandomTableState extends State<EditRandomTable> {
  @override
  Widget build(BuildContext context) {
    return const Text('HEllo');
  }
}
