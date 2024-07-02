import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/label_and_input.dart';
import 'package:mini_solo/widgets/my_reorderable_list_view.dart';

import '../../data/app_state.dart';
import '../../widgets/gap.dart';
import '../../widgets/label_and_switch.dart';
import '../../widgets/popups/popup_layout.dart';

class AddActionListPopup extends StatefulWidget {
  const AddActionListPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  State<AddActionListPopup> createState() => _AddActionListPopupState();
}

class _AddActionListPopupState extends State<AddActionListPopup> {
  late TextEditingController _labelController;
  late TextEditingController _actionLabelController;
  late String? selectedId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _labelController = TextEditingController();
    _actionLabelController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _labelController.dispose();
    _actionLabelController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupLayout(
        header: const Text('Add Action List'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LabelAndInput(
                label: 'Action List Label',
                controller: _labelController,
                onChanged: (value) {
                  setState(() {
                    _labelController.text = value;
                  });
                }),
            LabelAndSwitch(
              label: 'Active?',
              onChanged: (value) {},
              switchValue: true,
            ),
            Divider(),
            // MyReorderableListView(itemList: [], appState: appState, selectedId: '', onReorder: (){}, children: [Text('Child')])
            Gap(),
            const Text('Actions List'),
            Gap(),
            Container(
              height: 200.0,
              color: CupertinoColors.white,
              child: Text('List of Actions Here'),
            ),
            const Divider(),
            const Text('New Action'),
            const Text('current action link'),
            LabelAndInput(
                axis: Axis.horizontal,
                label: 'Label',
                controller: _actionLabelController,
                onChanged: (value) {}),
          ],
        ),
        footer: CupertinoButton(
          color: kSubmitColor,
          onPressed: () {},
          child: const Text('Add'),
        ));
  }
}
