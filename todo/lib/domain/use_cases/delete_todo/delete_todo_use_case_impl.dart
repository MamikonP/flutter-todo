import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/local_db_failure.dart';
import '../../../data/repositories/todo/todo_repository.dart';
import '../../entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../entities/entity.dart';
import 'delete_todo_use_case.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  const DeleteTodoUseCaseImpl(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<Either<Failure, EmptyEntity>> call(DeleteTodoEntity params) async {
    try {
      await _todoRepository.deleteTodo(params);
      return const Right<Failure, EmptyEntity>(EmptyEntity(null));
    } catch (e) {
      return Left<Failure, EmptyEntity>(LocalDbFailure());
    }
  }
}
