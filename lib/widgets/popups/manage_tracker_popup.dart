import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/widgets/list_button.dart';

import '../../data/campaign_data.dart';
import '../../icons.dart';
import '../gap.dart';
import '../my_slider.dart';
import '../picker.dart';

Map<TrackerTypes, String> _trackerTypes = {
  TrackerTypes.clock: 'Clock',
  TrackerTypes.bar: 'Bar',
  TrackerTypes.ironswornTrack: 'Ironsworn Track',
  TrackerTypes.pips: 'Pips',
  TrackerTypes.value: 'Value',
};

class ManageTrackerPopup extends StatefulWidget {
  const ManageTrackerPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  State<ManageTrackerPopup> createState() => _ManageTrackerPopupState();
}

class _ManageTrackerPopupState extends State<ManageTrackerPopup> {
  late TrackerTypes selectedType = TrackerTypes.clock;

  @override
  Widget build(BuildContext context) {
    var trackerTypes = _trackerTypes.values.toList();

    void handleChange(int index) {
      print('handle change ${_trackerTypes.keys.elementAt(index)}');
      setState(() {
        selectedType = _trackerTypes.keys.elementAt(index);
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tracker Name'),
          const Gap(),
          const CupertinoTextField(
            placeholder: 'Tracker name',
          ),
          const Gap(),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              trackerOptionButton(
                  images: [Images.clock4_0], label: '4 Segment Clock'),
              trackerOptionButton(
                  images: [Images.clock6_0], label: '6 Segment Clock'),
              trackerOptionButton(
                  images: [Images.clock8_0], label: '8 Segment Clock'),
              trackerOptionButton(
                images: [
                  Images.ironsworn_tick_4,
                  Images.ironsworn_tick_4,
                  Images.ironsworn_tick_4,
                ],
                label: 'Troublesome',
              ),
              trackerOptionButton(
                images: [
                  Images.ironsworn_tick_4,
                  Images.ironsworn_tick_4,
                ],
                label: 'Dangerous',
              ),
              trackerOptionButton(
                images: [
                  Images.ironsworn_tick_4,
                ],
                label: 'Formidable',
              ),
              trackerOptionButton(
                images: [Images.ironsworn_tick_2],
                label: 'Extreme',
              ),
              trackerOptionButton(
                images: [
                  Images.ironsworn_tick_1,
                ],
                label: 'Epic',
              ),
              trackerOptionButton(
                images: [
                  Images.pip_icon,
                ],
                label: 'Pip',
              ),
              trackerOptionButton(
                images: [
                  Images.bar_tracker,
                ],
                label: 'Bar',
              ),
              trackerOptionButton(
                images: [
                  Images.value_tracker,
                ],
                label: 'Simple Value',
              ),
            ],
          ),
          const Divider(),
          const Row(
            children: [
              Flexible(
                  child: CupertinoTextField(
                placeholder: 'min value',
              )),
              Gap(),
              Flexible(
                  child: CupertinoTextField(
                placeholder: 'current value',
              )),
              Gap(),
              Flexible(
                  child: CupertinoTextField(
                placeholder: 'max value',
              )),
            ],
          ),
          const Gap(),
          buttonBar(),
        ],
      ),
    );
  }

  Widget trackerOptionButton({
    required List<Images> images,
    String? label,
    double? size,
  }) {
    List<SvgIcon> svgIcons = images
        .map((image) => SvgIcon(
              icon: image,
              height: 24.0,
            ))
        .toList();

    return CupertinoButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: CupertinoColors.extraLightBackgroundGray,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ...svgIcons,
          if (label != null) const Gap(),
          if (label != null)
            Text(
              label,
              style: const TextStyle(color: CupertinoColors.black),
            ),
        ],
      ),
    );
  }

  CupertinoButton eightSegmentClockButton() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: CupertinoColors.extraLightBackgroundGray,
      onPressed: () {},
      child: const SvgIcon(icon: Images.clock8_0),
    );
  }

  CupertinoButton sixSegmentClockButton() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: CupertinoColors.extraLightBackgroundGray,
      onPressed: () {},
      child: const SvgIcon(icon: Images.clock6_0),
    );
  }

  CupertinoButton fourSegmentClockButton() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: CupertinoColors.extraLightBackgroundGray,
      onPressed: () {},
      child: const SvgIcon(icon: Images.clock4_0),
    );
  }

  Row buttonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
            color: kSubmitColour,
            onPressed: () {
              // Create Tracker from Class
              // Add to campaign data tracker collection
            },
            child: const Text('Save')),
        const Gap(),
        CupertinoButton(
            color: kWarningColour,
            onPressed: () {},
            child: const Text('Cancel')),
      ],
    );
  }
}
//
//   Widget simpleValueForm() => const Column(
//         children: [
//           Text('Simple Value'),
//           CupertinoTextField(
//             placeholder: 'Value',
//           ),
//         ],
//       );
//
//   Widget pipsForm() => const Column(
//         children: [
//           Text('Pips'),
//           CupertinoTextField(
//             placeholder: 'Number of Pips',
//           ),
//         ],
//       );
//
//   /*
//   TODO: Make this more visual.
//   The choices should be how many ticks you do each success.
//    */
//   Widget ironswornTrackerForm() => Column(
//         children: [
//           const Text('Ironsworn Track'),
//           Picker(items: const [
//             '*** Troublesome',
//             '** Dangerous',
//             '* Formidable',
//             'x Extreme',
//             '/\ Epic',
//           ], onChange: (index) {})
//         ],
//       );
//
//   Widget barForm() => const Column(
//         children: [
//           Text('Bar Tracker Settings'),
//           Gap(),
//           Row(
//             children: [
//               Flexible(
//                 child: CupertinoTextField(
//                   placeholder: 'Min',
//                 ),
//               ),
//               Gap(),
//               Flexible(
//                 child: CupertinoTextField(
//                   placeholder: 'Current',
//                 ),
//               ),
//               Gap(),
//               Flexible(
//                 child: CupertinoTextField(
//                   placeholder: 'Max',
//                 ),
//               ),
//             ],
//           )
//         ],
//       );
//
//   Widget clockForm() => Column(
//         children: [
//           Text('Number of Segments'),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: CupertinoButton(
//                     child: const SvgIcon(icon: Images.clock4_0),
//                     onPressed: () {}),
//               ),
//               Flexible(
//                 child: CupertinoButton(
//                     child: const SvgIcon(icon: Images.clock6_0),
//                     onPressed: () {}),
//               ),
//               Flexible(
//                 child: CupertinoButton(
//                     child: const SvgIcon(icon: Images.clock8_0),
//                     onPressed: () {}),
//               )
//             ],
//           ),
//         ],
//       );
// }
