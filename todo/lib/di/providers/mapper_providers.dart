import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/mapper/base_mapper.dart';
import '../../data/mapper/get_tasks_mapper.dart';
import '../../data/mapper/get_todos_mapper.dart';
import '../../data/models/todo_list/todo_list_model.dart';
import '../../data/models/todo_task/todo_task_model.dart';

List<RepositoryProvider<BaseMapper<dynamic>>> get mapperProviders =>
    <RepositoryProvider<BaseMapper<dynamic>>>[
      RepositoryProvider<BaseMapper<TodoListModel>>(
        create: (_) => GetTodosMapper(),
      ),
      RepositoryProvider<BaseMapper<TodoTaskModel>>(
        create: (_) => GetTasksMapper(),
      ),
    ];
