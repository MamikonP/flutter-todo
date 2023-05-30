import '../../../data/models/todo_list/todo_list_model.dart';
import '../../../data/models/todo_task/todo_task_model.dart';
import '../../entities/add_task/add_task_entity.dart';
import '../../entities/add_todo_list/add_todo_list_entity.dart';
import '../../entities/delete_todo_list/delete_todo_list_entity.dart';

abstract class TodoRepository {
  Future<List<TodoListModel>> getTodos();
  Future<void> addTodo(AddTodoListEntity entity);
  Future<void> deleteTodo(DeleteTodoEntity entity);
  Future<List<TodoTaskModel>> getAllTasks();
  Future<void> addTask(AddTaskEntity entity);
  Future<void> deleteTask(DeleteTodoEntity entity);
  Future<void> updateTask(AddTaskEntity entity);
}
