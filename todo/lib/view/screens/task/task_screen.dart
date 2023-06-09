import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/todo_task/todo_task_entity.dart';
import '../../../shared/gaps.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../router/navigation_router.dart';
import '../../router/navigation_routes.dart';
import '../../widgets/radio_button_widget.dart';
import '../home/constants/task_list_filter_by.dart';
import 'components/task_item.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen(this.tasks, this._navigationRouter, {super.key});

  final List<TodoTaskEntity> tasks;
  final NavigationRouter _navigationRouter;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return RadioButtonWidget<TaskListFilterBy>(
                        TaskListFilterBy.values,
                        onSaved: (TaskListFilterBy? filterBy) {
                          context.read<TodoBloc>().add(
                              UpdateFilterEvent(taskListFilterBy: filterBy));
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) =>
                      TaskItem(tasks[index], _navigationRouter),
                ),
              ),
            ],
          ),
          Positioned(
            right: Gaps.medium.value,
            bottom: Gaps.medium.value,
            child: FloatingActionButton(
                tooltip: 'Add task',
                child: const Icon(Icons.add),
                onPressed: () => _navigationRouter.push(
                    NavigationRoutes.addTask,
                    arguments: context.read<TodoBloc>())),
          ),
        ],
      ),
    );
  }
}
