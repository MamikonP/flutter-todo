import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../../domain/entities/todo_list/todo_list_entity.dart';
import '../../../shared/gaps.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../widgets/radio_button_widget.dart';
import 'components/todo_list_item.dart';
import 'constants/todo_list_filter_by.dart';
import 'helper/home_page_helper.dart';

mixin _Constants {
  static double get axisCount => 8.0;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen(this._homePageHelper, this.todos, {super.key});

  final HomePageHelper _homePageHelper;
  final List<TodoListEntity> todos;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.filter_alt_outlined),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return RadioButtonWidget<TodoListFilterBy>(
                            TodoListFilterBy.values,
                            onSaved: (TodoListFilterBy? filterBy) {
                              context.read<TodoBloc>().add(UpdateFilterEvent(
                                  todoListFilterBy: filterBy));
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                        // onTap: () => ,
                          onLongPress: () => context.read<TodoBloc>().add(
                              DeleteEvent(DeleteTodoEntity(todos[index].type))),
                          child: TodoListItem(todos[index], _homePageHelper)),
                  padding: EdgeInsets.all(_Constants.axisCount),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          _homePageHelper.crossAxisCount(constraints),
                      crossAxisSpacing: _Constants.axisCount,
                      mainAxisSpacing: _Constants.axisCount),
                ),
              ),
            ],
          ),
          Positioned(
            right: Gaps.medium.value,
            bottom: Gaps.medium.value,
            child: FloatingActionButton(
                tooltip: 'Add Todo List',
                child: const Icon(Icons.add),
                onPressed: () => _homePageHelper.onAddTodoList(context)),
          ),
        ],
      ),
    );
  }
}
