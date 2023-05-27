import 'package:flutter/material.dart';

import '../../../../data/models/todo_list/todo_list_color.dart';
import '../../../../domain/entities/todo_list/todo_list_entity.dart';
import '../../../../extension/date_time_formatter.dart';
import '../../../../shared/gaps.dart';
import '../helper/home_page_helper.dart';

mixin _Constants {
  static double get radius => 12.0;
  static double get blurRadius => 12.0;
}

class TodoListItem extends StatelessWidget {
  const TodoListItem(this._todoListEntity, this._homePageHelper, {super.key});

  final TodoListEntity _todoListEntity;
  final HomePageHelper _homePageHelper;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _homePageHelper.getTodoListAvailableColors()[
              _todoListEntity.color ?? TodoListColor.white],
          borderRadius: BorderRadius.circular(_Constants.radius),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, blurRadius: _Constants.blurRadius),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Gaps.medium.value, vertical: Gaps.small.value),
            child: const Icon(Icons.work),
          ),
          ListTile(
            title: Text(
              _todoListEntity.type,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(_todoListEntity.created
                    ?.formatDateToString(formatTo: FormatTo.fullTime) ??
                ''),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Gaps.medium.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_todoListEntity.tasks.length.toString()),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
