import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../widgets/picker.dart';
import 'group.dart';

class GroupPicker extends StatelessWidget {
  const GroupPicker({
    super.key,
    required this.appState,
    required this.onChange,
  });

  final AppState appState;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    List<Group> groupList = appState.groupList;
    List<String> listOfGroups = groupList.map((group) => group.label).toList();
    var groupIndex =
        groupList.indexWhere((group) => group.groupId == 'group-random-tables');

    return Row(
      children: [
        const Text('Group: '),
        Picker(
          items: listOfGroups,
          initialItem: groupIndex,
          onChange: (index) {
            onChange(groupList[index].groupId);
          },
        ),
      ],
    );
  }
}
