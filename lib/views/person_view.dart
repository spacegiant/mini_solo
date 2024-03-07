import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/list_button.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      ListButton(label: 'Random Name', onPressed: doSomething),
      ListButton(label: 'Male Name', onPressed: doSomething),
    ]);
  }
}

void doSomething() {
  print('pressed');
}
