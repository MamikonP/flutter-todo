import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/local_db_failure.dart';
import '../../../data/models/todo_list/todo_list_model.dart';
import '../../../data/repositories/todo/todo_repository.dart';
import '../../entities/todo_list/todo_list_entity.dart';
import 'get_todos_use_case.dart';

class GetTodosUseCaseImpl implements GetTodosUseCase {
  GetTodosUseCaseImpl(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<Either<Failure, List<TodoListEntity>>> call() async {
    try {
      final List<TodoListModel> models = await _todoRepository.getTodos();
      final List<TodoListEntity> entities =
          models.map((TodoListModel model) => model.toEntity()).toList();
      return Right<Failure, List<TodoListEntity>>(entities);
    } catch (e) {
      return Left<Failure, List<TodoListEntity>>(LocalDbFailure());
    }
  }
}
