part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadEvent implements TodoEvent {}

class AddEvent implements TodoEvent {
  const AddEvent(this.entity);

  final AddTodoListEntity entity;
}

class DeleteEvent implements TodoEvent {
  const DeleteEvent(this.entity);

  final DeleteTodoEntity entity;
}

class AddTaskEvent implements TodoEvent {
  const AddTaskEvent(this.entity);

  final AddTaskEntity entity;
}

class DeleteTaskEvent implements TodoEvent {
  const DeleteTaskEvent(this.entity);

  final DeleteTodoEntity entity;
}

class UpdateTaskDetailEvent implements TodoEvent {
  const UpdateTaskDetailEvent(this.entity);

  final AddTaskEntity entity;
}

class UpdateTaskItemEvent implements TodoEvent {
  const UpdateTaskItemEvent(this.entity);

  final TodoTaskEntity entity;
}
