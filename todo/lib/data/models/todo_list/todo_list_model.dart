// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/todo_list/todo_list_entity.dart';
import 'todo_list_color.dart';

part 'todo_list_model.freezed.dart';
part 'todo_list_model.g.dart';

extension TodoTaskModelMapperToEntity on TodoListModel {
  TodoListEntity toEntity() => TodoListEntity(type, color);
}

@freezed
class TodoListModel with _$TodoListModel {
  const factory TodoListModel({
    required String type,
    TodoListColor? color,
  }) = _TodoListModel;

  factory TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListModelFromJson(json);
}
