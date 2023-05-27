import 'package:equatable/equatable.dart';

import '../../../data/models/todo_list/todo_list_color.dart';
import '../entity.dart';

class TodoListEntity extends Equatable implements Entity {
  const TodoListEntity(this.type, this.color);
  final String type;
  final TodoListColor? color;

  @override
  List<Object?> get props => <Object?>[
        type,
        color,
      ];
}
