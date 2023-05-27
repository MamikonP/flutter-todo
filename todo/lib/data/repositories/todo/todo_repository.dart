import '../../models/todo_list/todo_list_model.dart';

abstract class TodoRepository {
  Future<List<TodoListModel>> getTodos();
}
