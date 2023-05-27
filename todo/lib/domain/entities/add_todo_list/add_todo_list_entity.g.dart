// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTodoListEntity _$AddTodoListEntityFromJson(Map<String, dynamic> json) =>
    AddTodoListEntity(
      json['type'] as String,
      $enumDecodeNullable(_$TodoListColorEnumMap, json['color']),
    );

Map<String, dynamic> _$AddTodoListEntityToJson(AddTodoListEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'color': _$TodoListColorEnumMap[instance.color],
    };

const _$TodoListColorEnumMap = {
  TodoListColor.red: 'red',
  TodoListColor.green: 'green',
  TodoListColor.blue: 'blue',
};
