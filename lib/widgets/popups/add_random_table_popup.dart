import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';

import '../gap.dart';

class AddRandomTablePopup extends StatelessWidget {
  const AddRandomTablePopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text(
            'ADD RANDOM TABLE',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          const Gap(),
          const CupertinoTextField(
            textAlignVertical: TextAlignVertical.top,
            placeholder: kLabelEnterFilename,
            clearButtonMode: OverlayVisibilityMode.editing,
          ),
          const SingleChildScrollView(
            child: CupertinoTextField(
              textAlignVertical: TextAlignVertical.top,
              placeholder: kLabelTypePasteHere,
              minLines: 10,
              maxLines: 10,
              clearButtonMode: OverlayVisibilityMode.editing,
            ),
          ),
          const Gap(),
          const Row(
            children: [
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: kSubmitColour,
              ),
              Gap(),
              Text('Validation'),
            ],
          ),
          const Gap(),
          Row(
            children: [
              CupertinoButton(
                  color: kSubmitColour,
                  child: const Text(kLabelAdd),
                  onPressed: () {}),
              const Gap(),
              CupertinoButton(
                  color: kWarningColour,
                  child: const Text(kLabelClose),
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
