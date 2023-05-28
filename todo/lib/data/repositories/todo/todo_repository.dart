import '../../../domain/entities/add_task/add_task_entity.dart';
import '../../../domain/entities/add_todo_list/add_todo_list_entity.dart';
import '../../../domain/entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../models/todo_list/todo_list_model.dart';
import '../../models/todo_task/todo_task_model.dart';

abstract class TodoRepository {
  Future<List<TodoListModel>> getTodos();
  Future<void> addTodo(AddTodoListEntity entity);
  Future<void> deleteTodo(DeleteTodoEntity entity);
  Future<List<TodoTaskModel>> getAllTasks();
  Future<void> addTask(AddTaskEntity entity);
  Future<void> deleteTask(DeleteTodoEntity entity);
  Future<void> updateTask(AddTaskEntity entity);
}
