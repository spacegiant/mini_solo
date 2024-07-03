import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/widgets/label_and_input.dart';
import 'package:mini_solo/widgets/label_and_picker.dart';
import 'package:mini_solo/widgets/my_reorderable_item.dart';

import '../../data/app_state.dart';
import '../../widgets/gap.dart';
import '../../widgets/label_and_switch.dart';
import '../../widgets/popups/popup_layout.dart';
import '../../widgets/popups/popup_layout_header.dart';
import '../../widgets/toggle_active_block.dart';

class ActionListAction {
  late String label;
  late String link;
}

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
  int? pickerIndex;
  late String entryTitle;
  late bool entryIsActive;
  List<ActionListAction> entryListOfActions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _labelController = TextEditingController(text: '');
    _actionLabelController = TextEditingController(text: '');
    isLink;
    entryTitle = '';
    entryIsActive = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _labelController.dispose();
    _actionLabelController.dispose();
  }

  Widget addLabel() {
    return Flexible(
      child: LabelAndInput(
        axis: Axis.horizontal,
        label: 'Label',
        controller: _actionLabelController,
        onChanged: (value) {
          setState(() {
            _actionLabelController.text = value;
          });
        },
      ),
    );
  }

  Widget addLink() {
    return Flexible(
      child: LabelAndPicker(
          enabled: true,
          label: 'Link',
          items: const ['one', 'two'],
          onChange: (value) {
            setState(() {
              pickerIndex = value;
            });
          },
          selectedIndex: pickerIndex),
    );
  }

  void handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    bool canSubmit() {
      return isLink == null && _labelController.value.text != '';
    }

    bool canAddNewAction =
        pickerIndex != null || _actionLabelController.value.text.trim() != '';

    bool displayLink = isLink == true;
    bool displayLabel = isLink != true;

    return PopupLayout(
        // TODO add sparkle icon here
        header: const PopupLayoutHeader(
          label: 'Add Action List',
          icon: CupertinoIcons.sparkles,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${entryTitle} ${entryIsActive.toString()}'),
            LabelAndInput(
                autoFocus: true,
                label: 'Action List Label',
                controller: _labelController,
                onChanged: (value) {
                  setState(() {
                    _labelController.text = value;
                    entryTitle = value;
                  });
                }),
            const Gap(),
            LabelAndSwitch(
              label: 'Active?',
              onChanged: (value) {
                setState(() {
                  entryIsActive = !entryIsActive;
                });
              },
              switchValue: entryIsActive,
            ),
            const Divider(),
            const Gap(),

            // MyReorderableListView(itemList: [], appState: appState, selectedId: '', onReorder: (){}, children: [Text('Child')])
            ...actionsList(),
            addNewEntryToolbar(),
            const Divider(),
            editBlock(displayLink, displayLabel, canAddNewAction),
          ],
        ),
        footer: CupertinoButton(
          color: kSubmitColor,
          onPressed: canSubmit() ? handleSubmit : null,
          child: const Text('Add'),
        ));
  }

  List<Widget> actionsList() {
    return [
      const Text('Actions List'),
      const Gap(height: 6.0),
      Container(
        height: 200.0,
        color: CupertinoColors.white,
        child: MyReorderableItem(
            id: '', appState: widget.appState, label: 'label', index: 1),
      )
    ];
  }

  Row addNewEntryToolbar() {
    return Row(
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
    );
  }

  ToggleActiveBlock editBlock(
      bool displayLink, bool displayLabel, bool canAddNewAction) {
    return ToggleActiveBlock(
      isActive: isLink != null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (displayLink) addLink(),
          if (displayLabel) addLabel(),
          ...[
            const Gap(),
            ToggleActiveBlock(
              isActive: canAddNewAction,
              child: submitActionListButton(),
            )
          ]
        ],
      ),
    );
  }

  CupertinoButton submitActionListButton() {
    return CupertinoButton(
      minSize: 44.0,
      padding: EdgeInsets.zero,
      color: kSubmitColor,
      child: const Icon(CupertinoIcons.add),
      onPressed: () {},
    );
  }
}
