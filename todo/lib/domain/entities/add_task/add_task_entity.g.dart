// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskEntity _$AddTaskEntityFromJson(Map<String, dynamic> json) =>
    AddTaskEntity(
      json['id'] as String,
      json['title'] as String,
      json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      json['tag'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$AddTaskEntityToJson(AddTaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueDate': instance.dueDate?.toIso8601String(),
      'tag': instance.tag,
      'type': instance.type,
    };
