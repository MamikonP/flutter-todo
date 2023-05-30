import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/datasources/local/local_db_service.dart';
import '../data/repositories/todo/todo_repository_impl.dart';
import '../domain/repositories/todo/todo_repository.dart';
import 'providers/local_db_provider.dart';

List<RepositoryProvider<dynamic>> get dataProviders =>
    <RepositoryProvider<dynamic>>[
      localDbProvider,
      RepositoryProvider<TodoRepository>(create: (BuildContext context) {
        final LocalDbService localDbService =
            RepositoryProvider.of<LocalDbService>(context);
        return TodoRepositoryImpl(localDbService);
      })
    ];
