// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeEntry _$TimeEntryFromJson(Map<String, dynamic> json) => TimeEntry(
      lastUpdated: DateTime.parse(json['at'] as String),
      billable: json['billable'] as bool,
      clientName: json['client_name'] as String?,
      description: json['description'] as String,
      duration: json['duration'] as int,
      onlyDuration: json['duronly'] as bool,
      id: json['id'] as int,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      projectIsActive: json['project_active'] as bool?,
      projectColor: json['project_color'] as String?,
      projectId: json['project_id'] as int?,
      projectName: json['project_name'] as String?,
      serverDeletedAt: json['server_deleted_at'] == null
          ? null
          : DateTime.parse(json['server_deleted_at'] as String),
      startTime: DateTime.parse(json['start'] as String),
      stopTime:
          json['stop'] == null ? null : DateTime.parse(json['stop'] as String),
      tagIds: (json['tag_ids'] as List<dynamic>).map((e) => e as int).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      taskId: json['task_id'] as int?,
      taskName: json['task_name'] as String?,
      userId: json['user_id'] as int,
      workspaceId: json['workspace_id'] as int,
    );

Map<String, dynamic> _$TimeEntryToJson(TimeEntry instance) => <String, dynamic>{
      'at': instance.lastUpdated.toIso8601String(),
      'billable': instance.billable,
      'client_name': instance.clientName,
      'description': instance.description,
      'duration': instance.duration,
      'duronly': instance.onlyDuration,
      'id': instance.id,
      'permissions': instance.permissions,
      'project_active': instance.projectIsActive,
      'project_color': instance.projectColor,
      'project_id': instance.projectId,
      'project_name': instance.projectName,
      'server_deleted_at': instance.serverDeletedAt?.toIso8601String(),
      'start': instance.startTime.toIso8601String(),
      'stop': instance.stopTime?.toIso8601String(),
      'tag_ids': instance.tagIds,
      'tags': instance.tags,
      'task_id': instance.taskId,
      'task_name': instance.taskName,
      'user_id': instance.userId,
      'workspace_id': instance.workspaceId,
    };
