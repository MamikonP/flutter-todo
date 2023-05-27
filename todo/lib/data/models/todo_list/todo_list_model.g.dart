// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoListModel _$$_TodoListModelFromJson(Map<String, dynamic> json) =>
    _$_TodoListModel(
      type: json['type'] as String,
      todoTasks: (json['todos'] as List<dynamic>?)
              ?.map((e) => TodoTaskModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TodoTaskModel>[],
    );

Map<String, dynamic> _$$_TodoListModelToJson(_$_TodoListModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'todos': instance.todoTasks,
    };
