import 'package:flutter_bloc/flutter_bloc.dart';

import 'providers/todo_usecase_provider.dart';

List<RepositoryProvider<dynamic>> get domainProviders =>
    <RepositoryProvider<dynamic>>[
      ...todoUseCaseProvider
    ];
