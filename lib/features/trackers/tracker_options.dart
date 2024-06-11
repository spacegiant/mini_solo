import '../../data/campaign_data.dart';
import '../../icons.dart';

class TrackerOptions {
  final String label;
  final TrackerTypes type;
  final List<Images> images;
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
    type: TrackerTypes.clock,
    images: [Images.clock4_0],
    maxValue: 4,
  ),
  TrackerOptions(
    label: '6 Segment',
    type: TrackerTypes.clock,
    images: [Images.clock6_0],
    maxValue: 6,
  ),
  TrackerOptions(
    label: '8 Segment',
    type: TrackerTypes.clock,
    images: [Images.clock8_0],
    maxValue: 8,
  ),
  TrackerOptions(
    label: 'Troublesome',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_4,
      Images.ironsworn_tick_4,
      Images.ironsworn_tick_4,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Dangerous',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_4,
      Images.ironsworn_tick_4,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Formidable',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_4,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Extreme',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_2,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Epic',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_1,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Pip',
    type: TrackerTypes.pips,
    images: [Images.pip_icon],
    minValue: 0,
    currentValue: 0,
    maxValue: 6,
    editCurrent: true,
    editMax: true,
  ),
  TrackerOptions(
    label: 'Bar',
    type: TrackerTypes.bar,
    images: [Images.bar_tracker],
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
    images: [Images.value_tracker],
    currentValue: 9,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Counter',
    type: TrackerTypes.counter,
    images: [Images.value_tracker],
    editCurrent: true,
    currentValue: 0,
  ),
];
