import 'package:hive/hive.dart';

import '../../../data/datasources/local/local_db_service.dart';
import '../../../data/models/todo_list/todo_list_model.dart';
import '../../../data/repositories/todo/todo_repository.dart';
import '../../entities/add_todo_list/add_todo_list_entity.dart';
import '../../entities/delete_todo_list/delete_todo_list_entity.dart';

mixin _Contants {
  static const String todoListKey = 'TODO_LIST';
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._localDbService);

  final LocalDbService _localDbService;

  Future<Box<Map<dynamic, dynamic>>> get databaseBox async =>
      _localDbService.open(_Contants.todoListKey);

  @override
  Future<List<TodoListModel>> getTodos() async {
    final Box<Map<dynamic, dynamic>> box = await databaseBox;
    final List<Map<dynamic, dynamic>> todos = _localDbService.getAll(box);
    return todos
        .map((Map<dynamic, dynamic> json) => TodoListModel.fromJson(json.map(
            (dynamic key, dynamic value) =>
                MapEntry<String, dynamic>(key as String, value))))
        .toList();
  }

  @override
  Future<void> addTodo(AddTodoListEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await databaseBox;
    if (!_localDbService.containsKey(box, entity.type)) {
      await _localDbService.put(box, entity.type, entity.toJson());
    }
  }

  @override
  Future<void> deleteTodo(DeleteTodoEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await databaseBox;
    if (_localDbService.containsKey(box, entity.type)) {
      await _localDbService.delete(box, entity.type);
    }
  }
}
