import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/todo_list/todo_list_color.dart';
import '../entity.dart';

part 'add_todo_list_entity.g.dart';

@JsonSerializable()
class AddTodoListEntity implements Entity {
  const AddTodoListEntity(this.type, this.color, this.created);

  factory AddTodoListEntity.fromJson(Map<String, dynamic> json) =>
      _$AddTodoListEntityFromJson(json);

  final String type;
  final TodoListColor? color;
  final DateTime? created;

  Map<String, dynamic> toJson() => _$AddTodoListEntityToJson(this);
}
