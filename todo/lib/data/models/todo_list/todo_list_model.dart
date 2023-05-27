// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/todo_list/todo_list_entity.dart';
import '../todo_task/todo_task_model.dart';

part 'todo_list_model.freezed.dart';
part 'todo_list_model.g.dart';

extension TodoTaskModelMapperToEntity on TodoListModel {
  TodoListEntity toEntity() => TodoListEntity(
      type, todoTasks.map((TodoTaskModel model) => model.toEntity()).toList());
}

@freezed
class TodoListModel with _$TodoListModel {
  const factory TodoListModel({
    required String type,
    @JsonKey(name: 'todos')
    @Default(<TodoTaskModel>[])
        List<TodoTaskModel> todoTasks,
  }) = _TodoListModel;

  factory TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListModelFromJson(json);
}
