import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/todo_task/todo_task_entity.dart';

part 'todo_task_model.freezed.dart';
part 'todo_task_model.g.dart';

extension TodoTaskModelMapperToEntity on TodoTaskModel {
  TodoTaskEntity toEntity() => TodoTaskEntity(id: id, title: title);
}

@freezed
class TodoTaskModel with _$TodoTaskModel {
  const factory TodoTaskModel({
    required String id,
    required String title,
    DateTime? dueDate,
    String? tag,
  }) = _TodoTaskModel;

  factory TodoTaskModel.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskModelFromJson(json);
}
