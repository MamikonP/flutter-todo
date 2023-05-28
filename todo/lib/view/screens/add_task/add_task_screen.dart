import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/todo_list/todo_list_entity.dart';
import '../../../domain/entities/todo_task/todo_task_entity.dart';
import '../../../extension/date_time_formatter.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../widgets/detail_item.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/input_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen(this._todoListEntity, this._todoTaskEntity, this.bloc,
      this.formKey, this.controller,
      {super.key});

  final List<TodoListEntity> _todoListEntity;
  final TodoTaskEntity? _todoTaskEntity;
  final TodoBloc? bloc;
  final GlobalKey<FormFieldState<dynamic>> formKey;
  final TextEditingController controller;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  void initState() {
    widget.controller.text = widget._todoTaskEntity?.title ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DetailItem(
            'What is to be done?',
            InputFormField(
              controller: widget.controller,
              hint: 'Add task',
              formKey: widget.formKey,
              onChanged: (String? value) {
                if (widget.bloc != null) {
                  if (widget._todoTaskEntity != null) {
                    widget.bloc!.add(UpdateTaskDetailEvent(
                        widget.bloc!.state.addTaskEntity,
                        taskEntity: widget._todoTaskEntity
                            ?.copyWith(title: value ?? '')));
                  }
                } else {
                  widget.bloc!.add(UpdateTaskDetailEvent(widget
                      .bloc!.state.addTaskEntity
                      .copyWith(title: value ?? '')));
                }
              },
              validator: (String? value) {
                return value != null && value.isNotEmpty
                    ? null
                    : 'Field is required';
              },
            )),
        DetailItem(
            'Due date',
            Column(
              children: <Widget>[
                DateTimePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateMask: FormatTo.yearMonthDay.format,
                  icon: const Icon(Icons.date_range),
                  dateLabelText: widget._todoTaskEntity?.dueDate
                          ?.formatDateToString(formatTo: FormatTo.fullTime) ??
                      'Select Date',
                  onChanged: (String value) {
                    if (widget.bloc != null) {
                      if (widget._todoTaskEntity != null) {
                        widget.bloc!.add(UpdateTaskDetailEvent(
                            widget.bloc!.state.addTaskEntity,
                            taskEntity: widget._todoTaskEntity
                                ?.copyWith(dueDate: DateTime.parse(value))));
                      } else {
                        widget.bloc!.add(UpdateTaskDetailEvent(widget
                            .bloc!.state.addTaskEntity
                            .copyWith(dueDate: DateTime.parse(value))));
                      }
                    }
                  },
                ),
                DateTimePicker(
                  type: DateTimePickerType.time,
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  firstDate: DateTime.now(),
                  dateMask: FormatTo.yearMonthDay.format,
                  icon: const Icon(Icons.access_time),
                  timeLabelText: widget._todoTaskEntity?.time ?? 'Select Time',
                  onChanged: (String value) {
                    if (widget.bloc != null) {
                      if (widget._todoTaskEntity != null) {
                        widget.bloc!.add(UpdateTaskDetailEvent(
                            widget.bloc!.state.addTaskEntity,
                            taskEntity:
                                widget._todoTaskEntity?.copyWith(time: value)));
                      } else {
                        widget.bloc!.add(UpdateTaskDetailEvent(widget
                            .bloc!.state.addTaskEntity
                            .copyWith(time: value)));
                      }
                    }
                  },
                ),
              ],
            )),
        DetailItem(
            'Add to list',
            DropDownWidget<String>(
              initialText: widget._todoTaskEntity?.type,
              onSelected: (String type) {
                if (widget.bloc != null) {
                  if (widget._todoTaskEntity != null) {
                    widget.bloc!.add(UpdateTaskDetailEvent(
                        widget.bloc!.state.addTaskEntity,
                        taskEntity:
                            widget._todoTaskEntity?.copyWith(type: type)));
                  } else {
                    widget.bloc!.add(UpdateTaskDetailEvent(
                        widget.bloc!.state.addTaskEntity.copyWith(type: type)));
                  }
                }
              },
              items: widget._todoListEntity
                  .map((TodoListEntity entity) => entity.type)
                  .toList(),
            )),
      ],
    );
  }
}
