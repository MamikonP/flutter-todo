import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/add_task/add_task_use_case.dart';
import '../../../domain/use_cases/add_todo/add_todo_use_case.dart';
import '../../../domain/use_cases/delete_task/delete_task_use_case.dart';
import '../../../domain/use_cases/delete_todo/delete_todo_use_case.dart';
import '../../../domain/use_cases/get_tasks/get_tasks_use_case.dart';
import '../../../domain/use_cases/get_todos/get_todos_use_case.dart';
import '../../../domain/use_cases/update_task/update_task_use_case.dart';
import '../../../shared/activity_overlay.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../screens/app_screen.dart';
import '../../screens/home/helper/home_page_helper.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/task/task_screen.dart';
import '../navigation_router.dart';

class HomePageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  HomePageRoute(this._homePageHelper,
      {RouteSettings? routeSettings, this.maintainState = true})
      : super(
          settings: routeSettings,
          fullscreenDialog: false,
        );

  final HomePageHelper _homePageHelper;

  @override
  Widget buildContent(BuildContext context) {
    final GetTodosUseCase getTodosUseCase =
        RepositoryProvider.of<GetTodosUseCase>(context);
    final AddTodoUseCase addTodoUseCase =
        RepositoryProvider.of<AddTodoUseCase>(context);
    final DeleteTodoUseCase deleteTodoUseCase =
        RepositoryProvider.of<DeleteTodoUseCase>(context);
    final GetTasksUseCase getTasksUseCase =
        RepositoryProvider.of<GetTasksUseCase>(context);
    final AddTaskUseCase addTaskUseCase =
        RepositoryProvider.of<AddTaskUseCase>(context);
    final DeleteTaskUseCase deleteTaskUseCase =
        RepositoryProvider.of<DeleteTaskUseCase>(context);
    final UpdateTaskUseCase updateTaskUseCase =
        RepositoryProvider.of<UpdateTaskUseCase>(context);
    final NavigationRouter navigationRouter =
        RepositoryProvider.of<NavigationRouter>(context);

    return BlocProvider<TodoBloc>(
      create: (BuildContext context) => TodoBloc(
          getTodosUseCase,
          addTodoUseCase,
          deleteTodoUseCase,
          getTasksUseCase,
          addTaskUseCase,
          deleteTaskUseCase,
          updateTaskUseCase)
        ..add(LoadEvent()),
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (BuildContext context, TodoState state) {
          if (state is TodoFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error ?? 'Invalid')));
          }
        },
        listenWhen:
            ActivityOverlayWidget.of(context).loadWhen<TodoState, TodoBusy>,
        builder: (BuildContext context, TodoState state) {
          return DefaultTabController(
            length: 2,
            child: AppScreen(
              appBar: AppBar(
                title: Text(state.page == 0 ? 'ToDo List' : 'Tasks'),
                bottom: TabBar(
                    onTap: (int value) {
                      context.read<TodoBloc>().add(UpdateToDoPageEvent(value));
                    },
                    tabs: const <Widget>[
                      Tab(icon: Icon(Icons.today_outlined)),
                      Tab(icon: Icon(Icons.task))
                    ]),
              ),
              content: TabBarView(children: <Widget>[
                HomeScreen(_homePageHelper, state.todos),
                TaskScreen(state.tasks, navigationRouter),
              ]),
            ),
          );
        },
      ),
    );
  }

  @override
  final bool maintainState;
}
