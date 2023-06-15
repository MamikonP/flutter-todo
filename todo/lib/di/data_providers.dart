import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/datasources/local/local_db_service.dart';
import '../data/mapper/base_mapper.dart';
import '../data/models/todo_list/todo_list_model.dart';
import '../data/models/todo_task/todo_task_model.dart';
import '../data/repositories/todo/todo_repository_impl.dart';
import '../domain/repositories/todo/todo_repository.dart';
import 'providers/local_db_provider.dart';
import 'providers/mapper_providers.dart';

List<RepositoryProvider<dynamic>> get dataProviders =>
    <RepositoryProvider<dynamic>>[
      localDbProvider,
      ...mapperProviders,
      RepositoryProvider<TodoRepository>(create: (BuildContext context) {
        final LocalDbService localDbService =
            RepositoryProvider.of<LocalDbService>(context);
        final BaseMapper<TodoListModel> todoListMapper =
            RepositoryProvider.of<BaseMapper<TodoListModel>>(context);
        final BaseMapper<TodoTaskModel> taskListMapper =
            RepositoryProvider.of<BaseMapper<TodoTaskModel>>(context);
        return TodoRepositoryImpl(localDbService,
            todoListMapper: todoListMapper, taskListMapper: taskListMapper);
      })
    ];
