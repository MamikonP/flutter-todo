import 'package:flutter/material.dart';

import '../../../domain/entities/todo_list/todo_list_entity.dart';
import 'components/todo_list_item.dart';
import 'helper/home_page_helper.dart';

mixin _Constants {
  static double get axisCount => 8.0;
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen(this._homePageHelper, this.todos, {super.key});

  final HomePageHelper _homePageHelper;
  final List<TodoListEntity> todos;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          GridView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) =>
            TodoListItem(todos[index], _homePageHelper),
        padding: EdgeInsets.all(_Constants.axisCount),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _homePageHelper.crossAxisCount(constraints),
            crossAxisSpacing: _Constants.axisCount,
            mainAxisSpacing: _Constants.axisCount),
      ),
    );
  }
}
