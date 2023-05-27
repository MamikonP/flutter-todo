import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/todo_list/todo_list_entity.dart';
import '../use_case.dart';

abstract class GetTodosUseCase
    extends UseCaseNoParams<List<TodoListEntity>> {
  @override
  Future<Either<Failure, List<TodoListEntity>>> call();
}
