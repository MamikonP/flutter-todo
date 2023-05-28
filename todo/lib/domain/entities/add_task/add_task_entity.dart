import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';

part 'add_task_entity.freezed.dart';
part 'add_task_entity.g.dart';

@freezed
class AddTaskEntity with _$AddTaskEntity implements Entity {
  const factory AddTaskEntity(String id, String title,
      {DateTime? dueDate,
      String? time,
      String? tag,
      String? type,
      bool? completed}) = _AddTaskEntity;

  factory AddTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$AddTaskEntityFromJson(json);
}
