import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';

import '../../data/app_state.dart';

class EditDiceGroupPopup extends StatefulWidget {
  final AppState appState;

  const EditDiceGroupPopup({
    super.key,
    required this.appState,
  });

  @override
  State<EditDiceGroupPopup> createState() => _EditDiceGroupPopupState();
}

class _EditDiceGroupPopupState extends State<EditDiceGroupPopup> {
  late List<String> controls;
  late bool isWrapped;

  @override
  void initState() {
    super.initState();
    isWrapped = widget.appState.wrapDiceControls;
  }

  @override
  Widget build(BuildContext context) {
    return PopupLayout(
        header: const Text('Edit Dice Group'),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CupertinoSwitch(
                    value: isWrapped,
                    onChanged: (value) {
                      setState(() {
                        isWrapped = !isWrapped;
                      });
                    }),
                const Text('Wrap controls'),
              ],
            ),
            CupertinoButton(
                color: kSubmitColor,
                onPressed: () {
                  // TODO
                  widget.appState.toggleWrapDiceControls(isWrapped);
                  Navigator.pop(context);
                },
                child: const Text('Update'))
          ],
        ),
        footer: const SizedBox.shrink());
  }
}
