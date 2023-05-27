part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadEvent implements TodoEvent {}
