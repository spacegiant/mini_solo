import '../features/grouping/group.dart';
import '../views/mythic/fate_question.dart';
import 'campaign_data.dart';
import 'initial_new_item_controls.dart';

var initialiseGroups = [
  Group(
    isAppGroup: false,
    groupId: 'unsorted',
    label: 'Unsorted',
    controls: [],
    color: 0xFF512500,
  ),
  Group(
    isAppGroup: true,
    groupId: 'group-mythic-fate-chart',
    label: 'Mythic Fate Chart',
    controls: initialMythicFateChartIds,
    color: 0xFF7D1D3F,
  ),
  Group(
    isAppGroup: true,
    groupId: 'group-mythic-gme',
    label: 'Mythic GME',
    controls: initialMythicGMEIds,
    color: 0xFF827191,
  ),
  Group(
    isAppGroup: false,
    groupId: 'group-random-tables',
    label: 'Random Tables',
    controls: [],
    color: 0xFF84ACCE,
  ),
  Group(
    isAppGroup: false,
    groupId: 'group-trackers',
    label: 'Trackers',
    controls: [],
    color: 0xFFD7D9B1,
  ),
  Group(
    isAppGroup: true,
    groupId: 'new-items',
    label: 'New Items',
    controls: initialNewItemControlIds,
    color: 0xFFFB8F67,
  ),
  Group(
    isAppGroup: false,
    groupId: 'group-action-lists',
    label: 'Action Lists',
    controls: [],
    color: 0xFFFB8F67,
  ),
];
