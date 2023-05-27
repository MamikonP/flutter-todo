import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/todo/todo_repository_provider.dart';
import 'providers/local_db_provider.dart';

List<RepositoryProvider<dynamic>> get dataProviders =>
    <RepositoryProvider<dynamic>>[
      localDbProvider,
      todoRepositoryProvider,
    ];
