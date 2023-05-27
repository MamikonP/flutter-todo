import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/bloc_state.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/add_todo_list/add_todo_list_entity.dart';
import '../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../../domain/entities/entity.dart';
import '../../../domain/entities/todo_list/todo_list_entity.dart';
import '../../../domain/use_cases/add_todo/add_todo_use_case.dart';
import '../../../domain/use_cases/delete_todo/delete_todo_use_case.dart';
import '../../../domain/use_cases/get_todos/get_todos_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._getTodosUseCase, this._addTodoUseCase, this._deleteTodoUseCase)
      : super(const TodoInitial()) {
    on<LoadEvent>(_mapLoadEventToState);
    on<AddEvent>(_mapAddEventToState);
    on<DeleteEvent>(_mapDeleteEventToState);
  }

  final GetTodosUseCase _getTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  FutureOr<void> _foldTodos(Emitter<TodoState> emit) async {
    final Either<Failure, List<TodoListEntity>> todos =
        await _getTodosUseCase();
    todos.fold((Failure left) {
      emit(TodoFailed(state, 'Failed to get todos'));
    }, (List<TodoListEntity> right) {
      emit(TodoLoaded(right));
    });
  }

  FutureOr<void> _mapLoadEventToState(
      LoadEvent event, Emitter<TodoState> emit) async {
    try {
      await _foldTodos(emit);
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddEventToState(
      AddEvent event, Emitter<TodoState> emit) async {
    try {
      final Either<Failure, EmptyEntity> entity =
          await _addTodoUseCase(event.entity);
      entity
          .fold((Failure left) => emit(TodoFailed(state, 'Failed to add todo')),
              (EmptyEntity right) async {
        await _foldTodos(emit);
      });
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapDeleteEventToState(
      DeleteEvent event, Emitter<TodoState> emit) async {
    try {
      final Either<Failure, EmptyEntity> entity =
          await _deleteTodoUseCase(event.entity);
      entity
          .fold((Failure left) => emit(TodoFailed(state, 'Failed to remove todo')),
              (EmptyEntity right) async {
        await _foldTodos(emit);
      });
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }
}
