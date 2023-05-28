import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/todo_task/todo_task_entity.dart';
import '../../../../extension/date_time_formatter.dart';
import '../../../bloc/todo/todo_bloc.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this._taskEntity, {super.key});

  final TodoTaskEntity _taskEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: CheckboxListTile(
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
        subtitle: Text(
          '${_taskEntity.dueDate?.formatDateToString(formatTo: FormatTo.yearMonthDay)} ${_taskEntity.time}',
          style: TextStyle(
              decoration: _taskEntity.completed == true
                  ? TextDecoration.lineThrough
                  : null,
              color: _taskEntity.completed == true ? Colors.grey : null),
        ),
      ),
    );
  }
}
