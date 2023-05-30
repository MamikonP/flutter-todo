import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/local_db_failure.dart';
import '../../entities/add_task/add_task_entity.dart';
import '../../entities/entity.dart';
import '../../repositories/todo/todo_repository.dart';
import 'add_task_use_case.dart';

class AddTaskUseCaseImpl implements AddTaskUseCase {
  const AddTaskUseCaseImpl(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<Either<Failure, EmptyEntity>> call(AddTaskEntity params) async {
    try {
      await _todoRepository.addTask(params);
      return const Right<Failure, EmptyEntity>(EmptyEntity(null));
    } catch (e) {
      return Left<Failure, EmptyEntity>(LocalDbFailure());
    }
  }
}
