import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/local_db_failure.dart';
import '../../../data/models/todo_task/todo_task_model.dart';
import '../../entities/todo_task/todo_task_entity.dart';
import '../../repositories/todo/todo_repository.dart';
import 'get_tasks_use_case.dart';

class GetTasksUseCaseImpl implements GetTasksUseCase {
  const GetTasksUseCaseImpl(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<Either<Failure, List<TodoTaskEntity>>> call() async {
    try {
      final List<TodoTaskModel> models = await _todoRepository.getAllTasks();
      final List<TodoTaskEntity> entities =
          models.map((TodoTaskModel model) => model.toEntity()).toList();
      return Right<Failure, List<TodoTaskEntity>>(entities);
    } catch (e) {
      return Left<Failure, List<TodoTaskEntity>>(LocalDbFailure());
    }
  }
}
