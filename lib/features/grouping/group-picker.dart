import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/label_and_picker.dart';

import '../../data/app_state.dart';
import 'group.dart';

class GroupPicker extends StatelessWidget {
  const GroupPicker({
    super.key,
    required this.appState,
    required this.onChange,
    this.initialGroup = 'unsorted',
  });

  final AppState appState;
  final Function(String) onChange;
  final String? initialGroup;

  @override
  Widget build(BuildContext context) {
    List<Group> groupList = List.from(appState.groupList);
    groupList.removeWhere((group) => group.isAppGroup == true);
    List<String> listOfGroups = groupList.map((group) => group.label).toList();

    return LabelAndPicker(
      label: 'Group: ',
      items: listOfGroups,
      onChange: (index) {
        if (index != null) onChange(groupList[index].groupId);
      },
    );
  }
}
