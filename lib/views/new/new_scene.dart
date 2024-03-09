import 'package:flutter/cupertino.dart';

import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';
import '../settings_view.dart';

class NewSceneMenu extends StatelessWidget {
  const NewSceneMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      const Output(
        text: ['This is a *test* test', 'This is a *test* test'],
      ),
      Wrap(
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        direction: Axis.horizontal,
        spacing: 10.0,
        runSpacing: -20.0,
        children: [
          SettingsOption(
            isActive: true,
            label: 'Send to journal',
            onChanged: (isChecked) {
              doSomething();
            },
          ),
          SettingsOption(
            isActive: true,
            label: 'Copy to clipboard',
            onChanged: (isChecked) {
              doSomething();
            },
          ),
        ],
      ),
      const SizedBox(),
      const ListButton(
        label: 'Mythic Action',
        onPressed: doSomething,
      ),
      const ListButton(
        label: 'Mythic Description',
        onPressed: doSomething,
      ),
      const ListButton(
        label: 'Mythic Description',
        onPressed: doSomething,
      ),
    ]);
  }
}

void doSomething() {
  print('pressed');
}

String mythicAction() {
  return 'This is a *Mythic Action* test';
}
