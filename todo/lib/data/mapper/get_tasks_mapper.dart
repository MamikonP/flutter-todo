import '../models/todo_task/todo_task_model.dart';
import 'base_mapper.dart';

class GetTasksMapper extends ListMapper<TodoTaskModel> {
  @override
  List<TodoTaskModel> models(dynamic body) =>
      parseModels(body, (dynamic json) => TodoTaskModel.fromJson(json));
}
