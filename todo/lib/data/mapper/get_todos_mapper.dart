import '../models/todo_list/todo_list_model.dart';
import 'base_mapper.dart';

class GetTodosMapper extends ListMapper<TodoListModel> {
  @override
  List<TodoListModel> models(dynamic body) =>
      parseModels(body, (dynamic json) => TodoListModel.fromJson(json));
}
