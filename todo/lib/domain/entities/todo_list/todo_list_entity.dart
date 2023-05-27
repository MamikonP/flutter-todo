import 'package:equatable/equatable.dart';

import '../../../data/models/todo_list/todo_list_color.dart';
import '../entity.dart';
import '../todo_task/todo_task_entity.dart';

class TodoListEntity extends Equatable implements Entity {
  const TodoListEntity(this.type, this.color, this.created, this.tasks);
  final String type;
  final TodoListColor? color;
  final DateTime? created;
  final List<TodoTaskEntity> tasks;

  @override
  List<Object?> get props => <Object?>[
        type,
        color,
        created,
        tasks,
      ];
}
