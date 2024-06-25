import 'package:flutter/cupertino.dart';

import '../../svg_icon.dart';
import '../gap.dart';

Widget trackerOptionButton({
  required List<SVGIcon> images,
  String? label,
  double? size,
  required String id,
  required String selectedId,
  required Function(String) onSelect,
}) {
  Color buttonColor = CupertinoColors.extraLightBackgroundGray;
  Color textColor = CupertinoColors.black;

  if (selectedId == id) {
    buttonColor = CupertinoColors.systemYellow;
  }

  List<SvgIcon> svgIcons = images
      .map((image) => SvgIcon(
            icon: image,
            height: 36.0,
          ))
      .toList();

  return CupertinoButton(
    onPressed: () {
      onSelect(id);
    },
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    color: buttonColor,
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...svgIcons,
        if (label != null) const Gap(),
        if (label != null)
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
      ],
    ),
  );
}
