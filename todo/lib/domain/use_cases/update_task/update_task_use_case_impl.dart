import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/local_db_failure.dart';
import '../../../data/repositories/todo/todo_repository.dart';
import '../../entities/add_task/add_task_entity.dart';
import '../../entities/entity.dart';
import 'update_task_use_case.dart';

class UpdateTaskUseCaseImpl implements UpdateTaskUseCase {
  const UpdateTaskUseCaseImpl(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<Either<Failure, EmptyEntity>> call(AddTaskEntity params) async {
    try {
      await _todoRepository.updateTask(params);
      return const Right<Failure, EmptyEntity>(EmptyEntity(null));
    } catch (e) {
      return Left<Failure, EmptyEntity>(LocalDbFailure());
    }
  }
}
