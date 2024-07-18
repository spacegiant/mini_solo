import '../features/grouping/group.dart';
import '../features/mythic_gme/initial_mythic_gme_controls.dart';
import '../views/mythic/fate_question.dart';
import 'initial_new_item_controls.dart';

var initialiseGroups = [
  Group(
    isAppGroup: false,
    groupId: 'unsorted',
    label: 'Unsorted',
    controlsIDs: [],
    color: 0xFF512500,
  ),
  Group(
    isAppGroup: true,
    groupId: 'group-mythic-fate-chart',
    label: 'Mythic Fate Chart',
    controlsIDs: initialMythicFateChartIds,
    color: 0xFF7D1D3F,
  ),
  Group(
    isAppGroup: true,
    groupId: 'group-mythic-gme',
    label: 'Mythic GME',
    controlsIDs: initialMythicGMEIds,
    color: 0xFF827191,
  ),
  Group(
    isAppGroup: false,
    groupId: 'group-random-tables',
    label: 'Random Tables',
    controlsIDs: [],
    color: 0xFF84ACCE,
  ),
  Group(
    isAppGroup: false,
    groupId: 'group-trackers',
    label: 'Trackers',
    controlsIDs: [],
    color: 0xFFD7D9B1,
  ),
  Group(
    isAppGroup: true,
    groupId: 'new-items',
    label: 'New Items',
    controlsIDs: initialNewItemControlIds,
    color: 0xFFFB8F67,
  ),
  Group(
    isAppGroup: false,
    groupId: 'group-action-lists',
    label: 'Action Lists',
    controlsIDs: [],
    color: 0xFFFB8F67,
  ),
];
