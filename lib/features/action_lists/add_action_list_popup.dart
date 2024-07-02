import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/label_and_input.dart';
import 'package:mini_solo/widgets/label_and_picker.dart';
import 'package:mini_solo/widgets/my_reorderable_item.dart';
import 'package:mini_solo/widgets/my_reorderable_list_view.dart';

import '../../data/app_state.dart';
import '../../widgets/gap.dart';
import '../../widgets/label_and_switch.dart';
import '../../widgets/popups/popup_layout.dart';
import '../../widgets/toggle_active_block.dart';

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
  bool? isLink;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _labelController = TextEditingController();
    _actionLabelController = TextEditingController();
    isLink;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _labelController.dispose();
    _actionLabelController.dispose();
  }

  Widget addLink() {
    return Flexible(
      child: LabelAndPicker(
          label: 'Link',
          items: ['one', 'two'],
          onChange: (value) {},
          selectedIndex: 0),
    );
  }

  Widget addLabel() {
    return Flexible(
      child: LabelAndInput(
        axis: Axis.horizontal,
        label: 'Label',
        controller: _actionLabelController,
        onChanged: (value) {},
      ),
    );
  }

  void handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    // TODO check there is something to submit
    bool canSubmit = isLink == null;
    String newLabel = '';
    String newLinkId = '';

    bool displayLink = isLink == true;
    bool displayLabel = isLink != true;

    return PopupLayout(
        header: const Text('Add Action List'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LabelAndInput(
                autoFocus: true,
                label: 'Action List Label',
                controller: _labelController,
                onChanged: (value) {
                  setState(() {
                    _labelController.text = value;
                  });
                }),
            Gap(),
            LabelAndSwitch(
              label: 'Active?',
              onChanged: (value) {},
              switchValue: true,
            ),
            const Divider(),
            const Gap(),
            const Text('Actions List'),
            const Gap(height: 6.0),
            // MyReorderableListView(itemList: [], appState: appState, selectedId: '', onReorder: (){}, children: [Text('Child')])
            Container(
              height: 200.0,
              color: CupertinoColors.white,
              child: MyReorderableItem(
                  id: '', appState: widget.appState, label: 'label', index: 1),
            ),
            Row(
              children: [
                CupertinoButton(
                    child: const Text('Add Link'),
                    onPressed: () {
                      setState(() {
                        isLink = true;
                      });
                    }),
                CupertinoButton(
                    child: const Text('Add Label'),
                    onPressed: () {
                      setState(() {
                        isLink = false;
                      });
                    }),
              ],
            ),
            const Divider(),

            ToggleActiveBlock(
              isActive: isLink != null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (displayLink) addLink(),
                  if (displayLabel) addLabel(),
                  ...[
                    const Gap(),
                    CupertinoButton(
                      minSize: 44.0,
                      padding: EdgeInsets.zero,
                      color: kSubmitColor,
                      child: const Icon(CupertinoIcons.add),
                      onPressed: () {},
                    )
                  ]
                ],
              ),
            ),
          ],
        ),
        footer: CupertinoButton(
          color: kSubmitColor,
          onPressed: canSubmit ? handleSubmit : null,
          child: const Text('Add'),
        ));
  }
}
