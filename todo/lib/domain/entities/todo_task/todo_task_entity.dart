import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity.dart';

part 'todo_task_entity.freezed.dart';
part 'todo_task_entity.g.dart';

@freezed
class TodoTaskEntity with _$TodoTaskEntity implements Entity {
  const factory TodoTaskEntity(
      {required String id,
      required String title,
      DateTime? dueDate,
      String? time,
      String? tag,
      String? type,
      bool? completed}) = _TodoTaskEntity;

  factory TodoTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskEntityFromJson(json);
}
