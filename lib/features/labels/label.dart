import 'package:json_annotation/json_annotation.dart';

part 'label.g.dart';

enum LabelLayout { vertical, horizontal }

@JsonSerializable()
class Label {
  final String labelId;
  final String title;
  final List<String>? lines;
  final LabelLayout? labelLayout;

  Label({
    required this.labelId,
    required this.title,
    this.lines,
    this.labelLayout,
  });

  // coverage:ignore-start

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  Map<String, dynamic> toJson() => _$LabelToJson(this);
// coverage:ignore-end
}
