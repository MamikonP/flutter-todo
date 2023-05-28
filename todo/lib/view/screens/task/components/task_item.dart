import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../../../domain/entities/todo_task/todo_task_entity.dart';
import '../../../../extension/date_time_formatter.dart';
import '../../../bloc/todo/todo_bloc.dart';
import '../../../router/navigation_router.dart';
import '../../../router/navigation_routes.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this._taskEntity, this._navigationRouter, {super.key});

  final TodoTaskEntity _taskEntity;
  final NavigationRouter _navigationRouter;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CheckboxListTile(
              isThreeLine: true,
              value: _taskEntity.completed ?? false,
              onChanged: (bool? value) {
                context.read<TodoBloc>().add(UpdateTaskItemEvent(
                    _taskEntity.copyWith(completed: value ?? false)));
              },
              title: Text(
                _taskEntity.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: _taskEntity.completed == true
                        ? TextDecoration.lineThrough
                        : null,
                    color: _taskEntity.completed == true ? Colors.grey : null),
              ),
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              checkColor: Theme.of(context).colorScheme.primary,
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${_taskEntity.dueDate?.formatDateToString(formatTo: FormatTo.yearMonthDay)} ${_taskEntity.time}',
                    style: TextStyle(
                        decoration: _taskEntity.completed == true
                            ? TextDecoration.lineThrough
                            : null,
                        color:
                            _taskEntity.completed == true ? Colors.grey : null),
                  ),
                  Visibility(
                    visible: _taskEntity.completed == true,
                    child: TextButton(
                      onPressed: () => context.read<TodoBloc>().add(
                          DeleteTaskEvent(DeleteTodoEntity(_taskEntity.id))),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                _navigationRouter.push(NavigationRoutes.addTask,
                    arguments: <dynamic>[
                      context.read<TodoBloc>(),
                      _taskEntity
                    ]);
              },
              icon: const Icon(Icons.edit))
        ],
      ),
    );
  }
}
