import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/label_and_picker.dart';

import '../../data/app_state.dart';
import 'group.dart';

class GroupPicker extends StatelessWidget {
  const GroupPicker({
    super.key,
    required this.appState,
    required this.onChange,
    this.initialGroupId = 'unsorted',
  });

  final AppState appState;
  final Function(String) onChange;
  final String? initialGroupId;

  @override
  Widget build(BuildContext context) {
    List<Group> groupList = List.from(appState.groupList);
    groupList.removeWhere((group) => group.isAppGroup == true);
    List<String> listOfGroups = groupList.map((group) => group.label).toList();
    int? initialItem = groupList
        .indexWhere((groupName) => groupName.groupId == initialGroupId);

    // TODO swap out groups for using tags?
    return LabelAndPicker(
      label: 'Group: ',
      items: listOfGroups,
      initialItem: initialItem,
      onChange: (index) {
        if (index != null) onChange(groupList[index].groupId);
      },
    );
  }
}
