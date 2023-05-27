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
