import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/add_todo/add_todo_use_case.dart';
import '../../../domain/use_cases/delete_todo/delete_todo_use_case.dart';
import '../../../domain/use_cases/get_todos/get_todos_use_case.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../screens/app_screen.dart';
import '../../screens/home/home_page_screen.dart';

class HomePageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  HomePageRoute({RouteSettings? routeSettings, this.maintainState = true})
      : super(
          settings: routeSettings,
          fullscreenDialog: false,
        );

  @override
  Widget buildContent(BuildContext context) {
    final GetTodosUseCase getTodosUseCase =
        RepositoryProvider.of<GetTodosUseCase>(context);
    final AddTodoUseCase addTodoUseCase =
        RepositoryProvider.of<AddTodoUseCase>(context);
    final DeleteTodoUseCase deleteTodoUseCase =
        RepositoryProvider.of<DeleteTodoUseCase>(context);

    return BlocProvider<TodoBloc>(
      create: (BuildContext context) =>
          TodoBloc(getTodosUseCase, addTodoUseCase, deleteTodoUseCase)
            ..add(LoadEvent()),
      child: AppScreen(
          appBar: AppBar(title: const Text('ToDo List')),
          content: const HomePageScreen()),
    );
  }

  @override
  final bool maintainState;
}
