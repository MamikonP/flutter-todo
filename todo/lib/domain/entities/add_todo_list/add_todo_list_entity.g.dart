// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTodoListEntity _$AddTodoListEntityFromJson(Map<String, dynamic> json) =>
    AddTodoListEntity(
      json['type'] as String,
      $enumDecodeNullable(_$TodoListColorEnumMap, json['color']),
      json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$AddTodoListEntityToJson(AddTodoListEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'color': _$TodoListColorEnumMap[instance.color],
      'created': instance.created?.toIso8601String(),
    };

const _$TodoListColorEnumMap = {
  TodoListColor.red: 'red',
  TodoListColor.green: 'green',
  TodoListColor.blue: 'blue',
  TodoListColor.amber: 'amber',
  TodoListColor.cyan: 'cyan',
  TodoListColor.deepOrange: 'deepOrange',
  TodoListColor.pink: 'pink',
  TodoListColor.indigo: 'indigo',
  TodoListColor.teal: 'teal',
  TodoListColor.yellow: 'yellow',
  TodoListColor.white: 'white',
};
