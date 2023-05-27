import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/todo_list/todo_list_entity.dart';
import '../use_case.dart';

abstract class GetTodosUseCase
    extends UseCase<List<TodoListEntity>, void> {
  @override
  Future<Either<Failure, List<TodoListEntity>>> call({void params});
}
