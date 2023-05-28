import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/gaps.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../screens/add_task/add_task_screen.dart';
import '../../screens/app_screen.dart';
import '../navigation_router.dart';

class AddTaskPageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  AddTaskPageRoute({RouteSettings? routeSettings, this.maintainState = true})
      : super(
          settings: routeSettings,
          fullscreenDialog: false,
        );

  @override
  Widget buildContent(BuildContext context) {
    final TodoBloc? todoBloc = settings.arguments as TodoBloc?;
    final NavigationRouter navigationRouter =
        RepositoryProvider.of<NavigationRouter>(context);

    return BlocBuilder<TodoBloc, TodoState>(
      bloc: settings.arguments as TodoBloc?,
      builder: (BuildContext context, TodoState state) {
        return AppScreen(
          appBar: AppBar(
            title: const Text('Create task'),
          ),
          content: Padding(
            padding: EdgeInsets.all(Gaps.small.value),
            child: AddTaskScreen(state.todos, settings.arguments as TodoBloc?),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Create task',
            child: const Icon(Icons.done),
            onPressed: () {
              if (todoBloc != null) {
                todoBloc.add(AddTaskEvent(state.addTaskEntity));
                navigationRouter.pop();
              }
            },
          ),
        );
      },
    );
  }

  @override
  final bool maintainState;
}
