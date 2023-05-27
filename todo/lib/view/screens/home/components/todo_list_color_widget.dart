import 'package:flutter/material.dart';

import '../../../../data/models/todo_list/todo_list_color.dart';
import '../../../../shared/gaps.dart';

mixin _Contants {
  static double get circleSize => 45.0;
}

class TodoListColorWidget extends StatefulWidget {
  const TodoListColorWidget(this.colors, {required this.onSelectColor, super.key});

  final Map<TodoListColor, Color> colors;
  final void Function(TodoListColor?) onSelectColor;

  @override
  State<TodoListColorWidget> createState() => _TodoListColorWidgetState();
}

class _TodoListColorWidgetState extends State<TodoListColorWidget> {
  TodoListColor? currentColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: Gaps.small.value,
        spacing: Gaps.small.value,
        children:
            widget.colors.entries.map((MapEntry<TodoListColor, Color> entry) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentColor = entry.key;
              });
              widget.onSelectColor(currentColor);
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: entry.value.withOpacity(0.7),
                  border: currentColor == entry.key
                      ? Border.all(color: Colors.black12)
                      : null),
              width: _Contants.circleSize,
              height: _Contants.circleSize,
            ),
          );
        }).toList());
  }
}
