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
import '../../../domain/use_cases/update_task/update_task_use_case.dart';
import '../../screens/home/constants/task_list_filter_by.dart';
import '../../screens/home/constants/todo_list_filter_by.dart';

part 'todo_event.dart';
part 'todo_state.dart';

extension TodoExtension on List<TodoListEntity> {
  List<TodoListEntity> filterAll() => this;

  void filterByDate() => sort((TodoListEntity first, TodoListEntity second) =>
      first.created?.compareTo(second.created ?? DateTime.now()) ?? 0);

  void filterByAlphabetical() =>
      sort((TodoListEntity first, TodoListEntity second) =>
          first.type.compareTo(second.type));
}

extension TaskExtension on List<TodoTaskEntity> {
  List<TodoTaskEntity> filterAll() => this;

  void filterByDate() => sort((TodoTaskEntity first, TodoTaskEntity second) =>
      first.dueDate?.compareTo(second.dueDate ?? DateTime.now()) ?? 0);

  void filterByAlphabetical() =>
      sort((TodoTaskEntity first, TodoTaskEntity second) =>
          first.title.compareTo(second.title));

  List<TodoTaskEntity> filterCompleted() =>
      where((TodoTaskEntity entity) => entity.completed == true).toList();

  List<TodoTaskEntity> filterNonCompleted() =>
      where((TodoTaskEntity entity) => entity.completed == false).toList();
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(
      this._getTodosUseCase,
      this._addTodoUseCase,
      this._deleteTodoUseCase,
      this._getTasksUseCase,
      this._addTaskUseCase,
      this._deleteTaskUseCase,
      this._updateTaskUseCase)
      : super(const TodoInitial()) {
    on<LoadEvent>(_mapLoadEventToState);
    on<AddEvent>(_mapAddEventToState);
    on<DeleteEvent>(_mapDeleteEventToState);
    on<AddTaskEvent>(_mapAddTaskEventToState);
    on<DeleteTaskEvent>(_mapDeleteTaskEventToState);
    on<UpdateTaskDetailEvent>(_mapUpdateTaskDetailEventToState);
    on<UpdateTaskItemEvent>(_mapUpdateTaskItemEventToState);
    on<UpdateToDoPageEvent>(_mapUpdateTodoPageEventToState);
    on<UpdateFilterEvent>(_mapUpdateFilterEventToState);
  }

  final GetTodosUseCase _getTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  String get uuid => const Uuid().v1();

  Future<void> _filterTodos(
      TodoListFilterBy filterBy, Emitter<TodoState> emit) async {
    await _foldTodos(emit);
    switch (filterBy) {
      case TodoListFilterBy.all:
        emit(TodoLoaded(state, todos: state.todos..filterAll()));
        break;
      case TodoListFilterBy.date:
        emit(TodoLoaded(state, todos: state.todos..filterByDate()));
        break;
      case TodoListFilterBy.alphabetical:
        emit(TodoLoaded(state, todos: state.todos..filterByAlphabetical()));
        break;
    }
  }

  Future<void> _filterTasks(
      TaskListFilterBy filterBy, Emitter<TodoState> emit) async {
    await _foldTasks(emit);
    switch (filterBy) {
      case TaskListFilterBy.all:
        emit(TodoLoaded(state, tasks: state.tasks..filterAll()));
        break;
      case TaskListFilterBy.date:
        emit(TodoLoaded(state, tasks: state.tasks..filterByDate()));
        break;
      case TaskListFilterBy.alphabetical:
        emit(TodoLoaded(state, tasks: state.tasks..filterByAlphabetical()));
        break;
      case TaskListFilterBy.completed:
        emit(TodoLoaded(state, tasks: state.tasks.filterCompleted()));
        break;
      case TaskListFilterBy.nonCompleted:
        emit(TodoLoaded(state, tasks: state.tasks.filterNonCompleted()));
        break;
    }
  }

  FutureOr<void> _foldTodos(Emitter<TodoState> emit) async {
    final Either<Failure, List<TodoListEntity>> todos =
        await _getTodosUseCase();
    todos.fold((Failure left) {
      emit(TodoFailed(state, 'Failed to get todos'));
    }, (List<TodoListEntity> right) {
      final List<TodoListEntity> todos = right.map((TodoListEntity todo) {
        state.tasks.map((TodoTaskEntity task) {
          if (task.type?.toLowerCase() == todo.type.toLowerCase()) {
            todo.tasks.add(task);
          }
          return task;
        }).toList();
        return todo;
      }).toList();
      emit(TodoLoaded(state, todos: todos));
    });
  }

  FutureOr<void> _foldTasks(Emitter<TodoState> emit) async {
    final Either<Failure, List<TodoTaskEntity>> tasks =
        await _getTasksUseCase();
    tasks.fold((Failure left) {
      emit(TodoFailed(state, 'Failed to get tasks'));
    }, (List<TodoTaskEntity> right) {
      emit(TodoLoaded(state,
          tasks: right
            ..sort(
              (TodoTaskEntity first, TodoTaskEntity second) =>
                  first.completed == true ? 1 : -1,
            )));
    });
  }

  FutureOr<void> _mapLoadEventToState(
      LoadEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoBusy(state));
      await _foldTasks(emit);
      await _foldTodos(emit);
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddEventToState(
      AddEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoBusy(state));
      final Either<Failure, EmptyEntity> entity =
          await _addTodoUseCase(event.entity);
      entity.fold(
          (Failure left) => emit(TodoFailed(state, 'Failed to add todo')),
          (EmptyEntity right) async {});
      if (state is! TodoFailed) {
        await _foldTodos(emit);
      }
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapDeleteEventToState(
      DeleteEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoBusy(state));
      final Either<Failure, EmptyEntity> entity =
          await _deleteTodoUseCase(event.entity);
      entity.fold(
          (Failure left) => emit(TodoFailed(state, 'Failed to remove todo')),
          (EmptyEntity right) async {});
      if (state is! TodoFailed) {
        await _foldTodos(emit);
      }
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddTaskEventToState(
      AddTaskEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoBusy(state));
      final Either<Failure, EmptyEntity> entity =
          await _addTaskUseCase(event.entity.copyWith(id: uuid));
      entity.fold(
          (Failure left) => emit(TodoFailed(state, 'Failed to add task')),
          (EmptyEntity right) async {});
      if (state is! TodoFailed) {
        await _foldTasks(emit);
      }
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapDeleteTaskEventToState(
      DeleteTaskEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoBusy(state));
      final Either<Failure, EmptyEntity> entity =
          await _deleteTaskUseCase(event.entity);
      entity.fold(
          (Failure left) =>
              emit(TodoFailed(state, 'Failed to delete the task')),
          (EmptyEntity right) async {});
      if (state is! TodoFailed) {
        await _foldTasks(emit);
      }
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapUpdateTaskDetailEventToState(
      UpdateTaskDetailEvent event, Emitter<TodoState> emit) async {
    emit(TodoBusy(state));
    emit(TaskDetailUpdated(state, event.entity, taskEntity: event.taskEntity));
  }

  FutureOr<void> _mapUpdateTaskItemEventToState(
      UpdateTaskItemEvent event, Emitter<TodoState> emit) async {
    try {
      emit(TodoBusy(state));
      await _updateTaskUseCase(AddTaskEntity.fromJson(event.entity.toJson()));
      await _foldTasks(emit);
    } catch (e) {
      emit(TodoFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapUpdateTodoPageEventToState(
      UpdateToDoPageEvent event, Emitter<TodoState> emit) {
    emit(TodoPageUpdated(state, page: event.page));
  }

  FutureOr<void> _mapUpdateFilterEventToState(
      UpdateFilterEvent event, Emitter<TodoState> emit) async {
    emit(TodoPageUpdated(state,
        todoFilter: event.todoListFilterBy,
        taskFilter: event.taskListFilterBy));
    if (event.todoListFilterBy != null) {
      await _filterTodos(event.todoListFilterBy!, emit);
    } else if (event.taskListFilterBy != null) {
      await _filterTasks(event.taskListFilterBy!, emit);
    }
  }
}
