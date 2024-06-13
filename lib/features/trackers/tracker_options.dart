import '../../data/campaign_data.dart';
import '../../svg_icon.dart';

class TrackerOptions {
  final String label;
  final TrackerTypes type;
  final List<SVGIcon> images;
  final int? minValue;
  final int? currentValue;
  final int? maxValue;
  final bool? editMin;
  final bool? editCurrent;
  final bool? editMax;

  TrackerOptions({
    required this.label,
    required this.type,
    required this.images,
    this.editMin = false,
    this.editCurrent = false,
    this.editMax = false,
    this.minValue,
    this.currentValue,
    this.maxValue,
  });
}

List<TrackerOptions> trackers = [
  TrackerOptions(
    label: '4 Segment',
    type: TrackerTypes.clock4,
    images: [SVGIcon.clock4_0],
    maxValue: 4,
    currentValue: 0,
    minValue: 0,
    editCurrent: true,
  ),
  TrackerOptions(
    label: '6 Segment',
    type: TrackerTypes.clock6,
    images: [SVGIcon.clock6_0],
    maxValue: 6,
    currentValue: 0,
    minValue: 0,
    editCurrent: true,
  ),
  TrackerOptions(
    label: '8 Segment',
    type: TrackerTypes.clock8,
    images: [SVGIcon.clock8_0],
    maxValue: 8,
    currentValue: 0,
    minValue: 0,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Troublesome',
    type: TrackerTypes.ironsworn1Troublesome,
    images: [
      SVGIcon.ironsworn_tick_4,
      SVGIcon.ironsworn_tick_4,
      SVGIcon.ironsworn_tick_4,
    ],
    minValue: 0,
    currentValue: 0,
    maxValue: 40,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Dangerous',
    type: TrackerTypes.ironsworn2Dangerous,
    images: [
      SVGIcon.ironsworn_tick_4,
      SVGIcon.ironsworn_tick_4,
    ],
    minValue: 0,
    currentValue: 0,
    maxValue: 40,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Formidable',
    type: TrackerTypes.ironsworn3Formidable,
    images: [
      SVGIcon.ironsworn_tick_4,
    ],
    minValue: 0,
    currentValue: 0,
    maxValue: 40,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Extreme',
    type: TrackerTypes.ironsworn4Extreme,
    images: [
      SVGIcon.ironsworn_tick_2,
    ],
    minValue: 0,
    currentValue: 0,
    maxValue: 40,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Epic',
    type: TrackerTypes.ironsworn5Epic,
    images: [
      SVGIcon.ironsworn_tick_1,
    ],
    minValue: 0,
    currentValue: 0,
    maxValue: 40,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Pip',
    type: TrackerTypes.pips,
    images: [SVGIcon.pip_icon],
    minValue: 0,
    currentValue: 0,
    maxValue: 6,
    editCurrent: true,
    editMax: true,
  ),
  TrackerOptions(
    label: 'Bar',
    type: TrackerTypes.bar,
    images: [SVGIcon.bar_tracker],
    minValue: 0,
    currentValue: 0,
    maxValue: 10,
    editMin: true,
    editCurrent: true,
    editMax: true,
  ),
  TrackerOptions(
    label: 'Simple Value',
    type: TrackerTypes.value,
    images: [SVGIcon.value_tracker],
    currentValue: 9,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Counter',
    type: TrackerTypes.counter,
    images: [SVGIcon.counter_tracker],
    editCurrent: true,
    currentValue: 0,
  ),
];
