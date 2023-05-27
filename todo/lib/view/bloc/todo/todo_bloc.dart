import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/bloc_state.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/todo_list/todo_list_entity.dart';
import '../../../domain/use_cases/get_todos/get_todos_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._getTodosUseCase) : super(const TodoInitial()) {
    on<LoadEvent>(_mapLoadEventToState);
  }

  final GetTodosUseCase _getTodosUseCase;

  FutureOr<void> _mapLoadEventToState(
      LoadEvent event, Emitter<TodoState> emit) async {
    try {
      final Either<Failure, List<TodoListEntity>> todos =
          await _getTodosUseCase();
      todos.fold(
          (Failure left) => emit(TodoFailed(state, "Couldn't get todos")),
          (List<TodoListEntity> right) => emit(TodoLoaded(right)));
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }
}
