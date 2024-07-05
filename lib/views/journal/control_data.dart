import '../../data/app_settings_data.dart';
import '../mythic/fate_question.dart';
import 'chooseControlWidget.dart';

class ControlData {
  final String controlId;
  final String label;
  final FateChartRow? fateChartRow;
  final RandomTableEntry? randomTable;
  final ActionListEntry? actionList;

  // final String group;
  final ControlTypeEnum controlType;

  ControlData({
    required this.controlId,
    required this.label,
    required this.controlType,
    this.fateChartRow,
    this.randomTable,
    this.actionList,
  });
}
