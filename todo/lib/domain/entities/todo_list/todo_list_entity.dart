import 'package:equatable/equatable.dart';

import '../todo_task/todo_task_entity.dart';

class TodoListEntity extends Equatable {
  const TodoListEntity(this.type, this.todoTasks);
  final String type;
  final List<TodoTaskEntity> todoTasks;

  @override
  List<Object?> get props => <Object>[
        todoTasks,
        todoTasks,
      ];
}
