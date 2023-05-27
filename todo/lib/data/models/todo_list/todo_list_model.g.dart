// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoListModel _$$_TodoListModelFromJson(Map<String, dynamic> json) =>
    _$_TodoListModel(
      type: json['type'] as String,
      color: $enumDecodeNullable(_$TodoListColorEnumMap, json['color']),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TodoTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TodoListModelToJson(_$_TodoListModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'color': _$TodoListColorEnumMap[instance.color],
      'created': instance.created?.toIso8601String(),
      'tasks': instance.tasks,
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
