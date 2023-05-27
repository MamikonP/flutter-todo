import 'package:flutter/material.dart';

import '../../../../data/models/todo_list/todo_list_color.dart';
import 'todo_list_helper_mixin.dart';

mixin MixinControllers {
  final TextEditingController controller = TextEditingController();
}

abstract class HomePageHelper with MixinControllers {
  int crossAxisCount(BoxConstraints constraints);
  void onAddTodoList(BuildContext context);
  Map<TodoListColor, Color> getTodoListAvailableColors();
}

class HomePageHelperImpl extends HomePageHelper with TodoListHelperMixin {}
