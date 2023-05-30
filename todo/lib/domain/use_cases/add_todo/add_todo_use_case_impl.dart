import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/local_db_failure.dart';
import '../../entities/add_todo_list/add_todo_list_entity.dart';
import '../../entities/entity.dart';
import '../../repositories/todo/todo_repository.dart';
import 'add_todo_use_case.dart';

class AddTodoUseCaseImpl implements AddTodoUseCase {
  const AddTodoUseCaseImpl(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<Either<Failure, EmptyEntity>> call(AddTodoListEntity params) async {
    try {
      await _todoRepository.addTodo(params);
      return const Right<Failure, EmptyEntity>(EmptyEntity(null));
    } catch (e) {
      return Left<Failure, EmptyEntity>(LocalDbFailure());
    }
  }
}
