import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/todo/todo_repository.dart';
import '../../domain/use_cases/get_todos/get_todos_use_case.dart';
import '../../domain/use_cases/get_todos/get_todos_use_case_impl.dart';

List<RepositoryProvider<dynamic>> get todoUseCaseProvider =>
    <RepositoryProvider<dynamic>>[
      RepositoryProvider<GetTodosUseCase>(create: (BuildContext context) {
        return GetTodosUseCaseImpl(
            RepositoryProvider.of<TodoRepository>(context));
      })
    ];
