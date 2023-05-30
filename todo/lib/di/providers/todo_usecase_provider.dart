import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/todo/todo_repository.dart';
import '../../domain/use_cases/add_task/add_task_use_case.dart';
import '../../domain/use_cases/add_task/add_task_use_case_impl.dart';
import '../../domain/use_cases/add_todo/add_todo_use_case.dart';
import '../../domain/use_cases/add_todo/add_todo_use_case_impl.dart';
import '../../domain/use_cases/delete_task/delete_task_use_case.dart';
import '../../domain/use_cases/delete_task/delete_task_use_case_impl.dart';
import '../../domain/use_cases/delete_todo/delete_todo_use_case.dart';
import '../../domain/use_cases/delete_todo/delete_todo_use_case_impl.dart';
import '../../domain/use_cases/get_tasks/get_tasks_use_case.dart';
import '../../domain/use_cases/get_tasks/get_tasks_use_case_impl.dart';
import '../../domain/use_cases/get_todos/get_todos_use_case.dart';
import '../../domain/use_cases/get_todos/get_todos_use_case_impl.dart';
import '../../domain/use_cases/update_task/update_task_use_case.dart';
import '../../domain/use_cases/update_task/update_task_use_case_impl.dart';

List<RepositoryProvider<dynamic>> get todoUseCaseProvider =>
    <RepositoryProvider<dynamic>>[
      RepositoryProvider<GetTodosUseCase>(create: (BuildContext context) {
        return GetTodosUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
      RepositoryProvider<AddTodoUseCase>(create: (BuildContext context) {
        return AddTodoUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
      RepositoryProvider<DeleteTodoUseCase>(create: (BuildContext context) {
        return DeleteTodoUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
      RepositoryProvider<GetTasksUseCase>(create: (BuildContext context) {
        return GetTasksUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
      RepositoryProvider<AddTaskUseCase>(create: (BuildContext context) {
        return AddTaskUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
      RepositoryProvider<DeleteTaskUseCase>(create: (BuildContext context) {
        return DeleteTaskUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
      RepositoryProvider<UpdateTaskUseCase>(create: (BuildContext context) {
        return UpdateTaskUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      }),
    ];
