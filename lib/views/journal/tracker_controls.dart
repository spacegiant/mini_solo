import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

class TrackerControls extends StatelessWidget {
  const TrackerControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WrapManager(wrapControls: true, children: [
      ListButton(
        iconData: CupertinoIcons.add,
        label: 'Add',
        onPressed: () {},
      )
    ]);
  }
}
