import '../../../domain/entities/add_todo_list/add_todo_list_entity.dart';
import '../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../models/todo_list/todo_list_model.dart';

abstract class TodoRepository {
  Future<List<TodoListModel>> getTodos();
  Future<void> addTodo(AddTodoListEntity entity);
  Future<void> deleteTodo(DeleteTodoEntity entity);
}
