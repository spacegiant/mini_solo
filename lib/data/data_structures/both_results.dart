import 'package:json_annotation/json_annotation.dart';

part 'both_results.g.dart';

@JsonSerializable()
class BothResults {
  final int rolledValue;
  final String? label;

  BothResults({
    required this.rolledValue,
    this.label,
  });

  // coverage:ignore-start
  factory BothResults.fromJson(Map<String, dynamic> json) =>
      _$BothResultsFromJson(json);

  Map<String, dynamic> toJson() => _$BothResultsToJson(this);

// coverage:ignore-end
}
