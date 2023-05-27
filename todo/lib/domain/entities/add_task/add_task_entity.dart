import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';

part 'add_task_entity.g.dart';

@JsonSerializable()
class AddTaskEntity implements Entity {
  const AddTaskEntity(this.id, this.title, this.dueDate, this.tag, this.type);

  factory AddTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$AddTaskEntityFromJson(json);

  final String id;
  final String title;
  final DateTime? dueDate;
  final String? tag;
  final String? type;

  Map<String, dynamic> toJson() => _$AddTaskEntityToJson(this);
}
