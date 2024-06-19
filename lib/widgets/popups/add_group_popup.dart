import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/features/grouping/group.dart';
import 'package:mini_solo/utilities/id_generator.dart';
import '../../data/app_state.dart';

class AddGroupPopup extends StatefulWidget {
  const AddGroupPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<AddGroupPopup> createState() => _AddGroupPopupState();
}

class _AddGroupPopupState extends State<AddGroupPopup> {
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
    print(widget.appState.groupList);
    List<Widget> groupWidgets = widget.appState.groupList
        .map((groupItem) => Text(groupItem.label))
        .toList();

    return Column(children: [
      SizedBox(
        height: 200.0,
        child: SingleChildScrollView(
          child: Column(
            children: groupWidgets,
          ),
        ),
      ),
      const Divider(),
      CupertinoTextField(
        controller: _controller,
      ),
      CupertinoButton(
        color: CupertinoColors.systemPink,
        onPressed: () {
          String text = _controller.value.text.trim();
          if (text == '') return;
          widget.appState.createNewGroup(
            Group(groupId: genericId('group'), label: text),
          );
          _controller.text = '';
        },
        child: const Text('Add'),
      )
    ]);
  }
}
