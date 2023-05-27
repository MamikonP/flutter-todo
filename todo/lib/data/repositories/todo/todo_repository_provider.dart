import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/todo/todo_repository_impl.dart';
import '../../datasources/local/local_db_service.dart';
import 'todo_repository.dart';

RepositoryProvider<TodoRepository> get todoRepositoryProvider =>
    RepositoryProvider<TodoRepository>(create: (BuildContext context) {
      final LocalDbService localDbService =
          RepositoryProvider.of<LocalDbService>(context);
      return TodoRepositoryImpl(localDbService);
    });
