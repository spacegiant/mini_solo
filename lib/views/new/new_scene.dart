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
      const Output(),
      SettingsOption(
        isActive: true,
        label: 'Send to journal',
        onChanged: (isChecked) {
          doSomething();
        },
      ),
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
