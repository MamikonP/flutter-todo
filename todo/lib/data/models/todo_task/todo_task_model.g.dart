// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoTaskModel _$$_TodoTaskModelFromJson(Map<String, dynamic> json) =>
    _$_TodoTaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$_TodoTaskModelToJson(_$_TodoTaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueDate': instance.dueDate?.toIso8601String(),
      'tag': instance.tag,
    };
