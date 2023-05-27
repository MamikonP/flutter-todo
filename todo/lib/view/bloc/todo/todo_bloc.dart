import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../../core/bloc_state.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/add_task/add_task_entity.dart';
import '../../../domain/entities/add_todo_list/add_todo_list_entity.dart';
import '../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../../domain/entities/entity.dart';
import '../../../domain/entities/todo_list/todo_list_entity.dart';
import '../../../domain/entities/todo_task/todo_task_entity.dart';
import '../../../domain/use_cases/add_task/add_task_use_case.dart';
import '../../../domain/use_cases/add_todo/add_todo_use_case.dart';
import '../../../domain/use_cases/delete_task/delete_task_use_case.dart';
import '../../../domain/use_cases/delete_todo/delete_todo_use_case.dart';
import '../../../domain/use_cases/get_tasks/get_tasks_use_case.dart';
import '../../../domain/use_cases/get_todos/get_todos_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._getTodosUseCase, this._addTodoUseCase, this._deleteTodoUseCase,
      this._getTasksUseCase, this._addTaskUseCase, this._deleteTaskUseCase)
      : super(const TodoInitial()) {
    on<LoadEvent>(_mapLoadEventToState);
    on<AddEvent>(_mapAddEventToState);
    on<DeleteEvent>(_mapDeleteEventToState);
    on<AddTaskEvent>(_mapAddTaskEventToState);
    on<DeleteTaskEvent>(_mapDeleteTaskEventToState);
  }

  final GetTodosUseCase _getTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  String get uuid => const Uuid().v1();

  FutureOr<void> _foldTodos(Emitter<TodoState> emit) async {
    final Either<Failure, List<TodoListEntity>> todos =
        await _getTodosUseCase();
    todos.fold((Failure left) {
      emit(TodoFailed(state, 'Failed to get todos'));
    }, (List<TodoListEntity> right) {
      emit(TodoLoaded(state, todos: right));
    });
  }

  FutureOr<void> _foldTasks(Emitter<TodoState> emit) async {
    final Either<Failure, List<TodoTaskEntity>> tasks =
        await _getTasksUseCase();
    tasks.fold((Failure left) {
      emit(TodoFailed(state, 'Failed to get tasks'));
    }, (List<TodoTaskEntity> right) {
      emit(TodoLoaded(state, tasks: right));
    });
  }

  FutureOr<void> _mapLoadEventToState(
      LoadEvent event, Emitter<TodoState> emit) async {
    try {
      await _foldTodos(emit);
      await _foldTasks(emit);
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
      entity.fold(
          (Failure left) => emit(TodoFailed(state, 'Failed to remove todo')),
          (EmptyEntity right) async {
        await _foldTodos(emit);
      });
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddTaskEventToState(
      AddTaskEvent event, Emitter<TodoState> emit) async {
    try {
      final Either<Failure, EmptyEntity> entity =
          await _addTaskUseCase(event.entity);
      entity
          .fold((Failure left) => emit(TodoFailed(state, 'Failed to add task')),
              (EmptyEntity right) async {
        await _foldTasks(emit);
      });
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapDeleteTaskEventToState(
      DeleteTaskEvent event, Emitter<TodoState> emit) async {
    try {
      final Either<Failure, EmptyEntity> entity =
          await _deleteTaskUseCase(event.entity);
      entity.fold(
          (Failure left) =>
              emit(TodoFailed(state, 'Failed to delete the task')),
          (EmptyEntity right) async {
        await _foldTasks(emit);
      });
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }
}
