import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

class RandomNames extends StatelessWidget {
  const RandomNames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WrapManager(
      wrapControls: true,
      children: [
        ListButton(label: 'label', onPressed: () {}),
      ],
    );
  }
}
