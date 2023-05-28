// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddTaskEntity _$$_AddTaskEntityFromJson(Map<String, dynamic> json) =>
    _$_AddTaskEntity(
      json['id'] as String,
      json['title'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      time: json['time'] as String?,
      tag: json['tag'] as String?,
      type: json['type'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$_AddTaskEntityToJson(_$_AddTaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueDate': instance.dueDate?.toIso8601String(),
      'time': instance.time,
      'tag': instance.tag,
      'type': instance.type,
      'completed': instance.completed,
    };
