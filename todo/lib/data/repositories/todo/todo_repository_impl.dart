import 'package:hive/hive.dart';

import '../../../domain/entities/add_task/add_task_entity.dart';
import '../../../domain/entities/add_todo_list/add_todo_list_entity.dart';
import '../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../../domain/repositories/todo/todo_repository.dart';
import '../../../extension/map_extension.dart';
import '../../datasources/local/local_db_service.dart';
import '../../mapper/base_mapper.dart';
import '../../models/todo_list/todo_list_model.dart';
import '../../models/todo_task/todo_task_model.dart';

mixin _Contants {
  static const String todoListKey = 'TODO_LIST';
  static const String todoTaskKey = 'TODO_TASK';
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._localDbService,
      {required this.todoListMapper, required this.taskListMapper});

  final LocalDbService _localDbService;
  final BaseMapper<TodoListModel> todoListMapper;
  final BaseMapper<TodoTaskModel> taskListMapper;

  Future<Box<Map<dynamic, dynamic>>> get todoListBox async =>
      _localDbService.open(_Contants.todoListKey);

  Future<Box<Map<dynamic, dynamic>>> get todoTaskBox async =>
      _localDbService.open(_Contants.todoTaskKey);

  @override
  Future<List<TodoListModel>> getTodos() async {
    final Box<Map<dynamic, dynamic>> box = await todoListBox;
    final List<Map<dynamic, dynamic>> todos = _localDbService.getAll(box);
    return todoListMapper.result(todos.toMapStringKey());
  }

  @override
  Future<void> addTodo(AddTodoListEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await todoListBox;
    if (!_localDbService.containsKey(box, entity.type)) {
      await _localDbService.put(box, entity.type, entity.toJson());
    }
  }

  @override
  Future<void> deleteTodo(DeleteTodoEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await todoListBox;
    if (_localDbService.containsKey(box, entity.id)) {
      await _localDbService.delete(box, entity.id);
    }
  }

  @override
  Future<List<TodoTaskModel>> getAllTasks() async {
    final Box<Map<dynamic, dynamic>> box = await todoTaskBox;
    final List<Map<dynamic, dynamic>> tasks = _localDbService.getAll(box);
    return taskListMapper.result(tasks.toMapStringKey());
  }

  @override
  Future<void> addTask(AddTaskEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await todoTaskBox;
    await _localDbService.put(box, entity.id, entity.toJson());
  }

  @override
  Future<void> deleteTask(DeleteTodoEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await todoTaskBox;
    if (_localDbService.containsKey(box, entity.id)) {
      await _localDbService.delete(box, entity.id);
    }
  }

  @override
  Future<void> updateTask(AddTaskEntity entity) async {
    final Box<Map<dynamic, dynamic>> box = await todoTaskBox;
    if (_localDbService.containsKey(box, entity.id)) {
      await _localDbService.put(box, entity.id, entity.toJson());
    }
  }
}
