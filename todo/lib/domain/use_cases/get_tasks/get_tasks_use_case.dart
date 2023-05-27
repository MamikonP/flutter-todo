import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/todo_task/todo_task_entity.dart';
import '../use_case.dart';

abstract class GetTasksUseCase extends UseCaseNoParams<List<TodoTaskEntity>> {
  @override
  Future<Either<Failure, List<TodoTaskEntity>>> call();
}
