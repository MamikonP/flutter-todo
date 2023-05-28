// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/todo_task/todo_task_entity.dart';
import '../../../shared/gaps.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../screens/add_task/add_task_screen.dart';
import '../../screens/app_screen.dart';
import '../navigation_router.dart';

mixin _Controllers {
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormFieldState<dynamic>> formKey =
      GlobalKey<FormFieldState<dynamic>>();
}

class AddTaskPageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T>, _Controllers {
  AddTaskPageRoute({RouteSettings? routeSettings, this.maintainState = true})
      : super(
          settings: routeSettings,
          fullscreenDialog: false,
        );

  TodoBloc? todoBloc;
  TodoTaskEntity? taskEntity;
  @override
  Widget buildContent(BuildContext context) {
    if (settings.arguments.runtimeType == List<dynamic>) {
      todoBloc = (settings.arguments as List<dynamic>)[0] as TodoBloc?;
      taskEntity = (settings.arguments as List<dynamic>)[1] as TodoTaskEntity?;
    } else {
      todoBloc = settings.arguments as TodoBloc?;
    }
    final NavigationRouter navigationRouter =
        RepositoryProvider.of<NavigationRouter>(context);

    return BlocBuilder<TodoBloc, TodoState>(
      bloc: todoBloc,
      builder: (BuildContext context, TodoState state) {
        return AppScreen(
          appBar: AppBar(
            title: const Text('Create task'),
          ),
          content: Padding(
            padding: EdgeInsets.all(Gaps.small.value),
            child: AddTaskScreen(
                state.todos, taskEntity, todoBloc, formKey, titleController),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Create task',
            child: const Icon(Icons.done),
            onPressed: () {
              if (todoBloc != null) {
                if (formKey.currentState?.validate() == true) {
                  if (taskEntity != null) {
                    todoBloc?.add(
                        UpdateTaskItemEvent(state.taskEntity ?? taskEntity!));
                  } else {
                    todoBloc?.add(AddTaskEvent(state.addTaskEntity));
                  }
                  navigationRouter.pop();
                }
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
