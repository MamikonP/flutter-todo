import 'package:hive/hive.dart';

import '../../../data/datasources/local/local_db_service.dart';
import '../../../data/models/todo_list/todo_list_model.dart';
import '../../../data/repositories/todo/todo_repository.dart';

mixin _Contants {
  static const String todoListKey = 'TODO_LIST';
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._localDbService);

  final LocalDbService _localDbService;

  @override
  Future<List<TodoListModel>> getTodos() async {
    final Box<Map<dynamic, dynamic>> box =
        await _localDbService.open(_Contants.todoListKey);
    final List<Map<dynamic, dynamic>> todos = _localDbService.getAll(box);
    return todos
        .map((Map<dynamic, dynamic> json) => TodoListModel.fromJson(json.map(
            (dynamic key, dynamic value) =>
                MapEntry<String, dynamic>(key as String, value))))
        .toList();
  }
}
