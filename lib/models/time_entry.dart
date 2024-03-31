import 'package:timer_app/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_entry.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TimeEntry {
  @JsonKey(name: 'at')
  final DateTime lastUpdated;

  final bool billable;
  final String? clientName;
  final String description;
  final int duration;

  @JsonKey(name: 'duronly')
  final bool onlyDuration;

  final int id;
  final List<String>? permissions;

  @JsonKey(name: 'project_active')
  final bool? projectIsActive;

  final String? projectColor;
  final int? projectId;
  final String? projectName;
  final DateTime? serverDeletedAt;

  @JsonKey(name: 'start')
  final DateTime startTime;

  @JsonKey(name: 'stop')
  final DateTime? stopTime;

  final List<int> tagIds;
  final List<String> tags;
  final int? taskId;
  final String? taskName;
  final int userId;
  final int workspaceId;

  const TimeEntry({
    required this.lastUpdated,
    required this.billable,
    this.clientName,
    required this.description,
    required this.duration,
    required this.onlyDuration,
    required this.id,
    required this.permissions,
    required this.projectIsActive,
    required this.projectColor,
    this.projectId,
    required this.projectName,
    this.serverDeletedAt,
    required this.startTime,
    this.stopTime,
    required this.tagIds,
    required this.tags,
    this.taskId,
    required this.taskName,
    required this.userId,
    required this.workspaceId,
  });

  factory TimeEntry.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryFromJson(json);
}
