// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoListModel _$$_TodoListModelFromJson(Map<String, dynamic> json) =>
    _$_TodoListModel(
      type: json['type'] as String,
      color: $enumDecodeNullable(_$TodoListColorEnumMap, json['color']),
    );

Map<String, dynamic> _$$_TodoListModelToJson(_$_TodoListModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'color': _$TodoListColorEnumMap[instance.color],
    };

const _$TodoListColorEnumMap = {
  TodoListColor.red: 'red',
  TodoListColor.green: 'green',
  TodoListColor.blue: 'blue',
};
