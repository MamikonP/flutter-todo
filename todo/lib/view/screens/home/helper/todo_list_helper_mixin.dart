import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/todo_list/todo_list_color.dart';
import '../../../../domain/entities/add_todo_list/add_todo_list_entity.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/gaps.dart';
import '../../../../shared/show_popup.dart';
import '../../../bloc/todo/todo_bloc.dart';
import '../../../widgets/input_field.dart';
import '../components/todo_list_color_widget.dart';
import 'home_page_helper.dart';

mixin TodoListHelperMixin on HomePageHelper {
  @override
  int crossAxisCount(BoxConstraints constraints) =>
      constraints.maxWidth > Constants.mobileScreenMaxWidth ? 4 : 2;

  @override
  void onAddTodoList(BuildContext context) {
    TodoListColor? selectedColor;
    showPopup(
        context,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InputField(
              controller: controller,
              hint: 'Add todo list',
            ),
            Padding(
              padding: EdgeInsets.all(Gaps.small.value),
              child: const Text('Select color:'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Gaps.medium.value),
              child: TodoListColorWidget(
                getTodoListAvailableColors(),
                onSelectColor: (TodoListColor? color) {
                  selectedColor = color;
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<TodoBloc>().add(AddEvent(AddTodoListEntity(
                      controller.text, selectedColor, DateTime.now())));
                },
                child: Text(
                  'Create',
                  textAlign: TextAlign.end,
                ))
          ],
        ),
        padding: const EdgeInsets.all(8));
  }

  @override
  Map<TodoListColor, Color> getTodoListAvailableColors() =>
      <TodoListColor, Color>{
        TodoListColor.red: Colors.redAccent,
        TodoListColor.green: Colors.greenAccent,
        TodoListColor.blue: Colors.blueAccent,
        TodoListColor.amber: Colors.amberAccent,
        TodoListColor.cyan: Colors.cyanAccent,
        TodoListColor.deepOrange: Colors.deepOrangeAccent,
        TodoListColor.pink: Colors.pinkAccent,
        TodoListColor.indigo: Colors.indigoAccent,
        TodoListColor.teal: Colors.tealAccent,
        TodoListColor.yellow: Colors.yellowAccent,
        TodoListColor.white: Colors.white,
      };
}
