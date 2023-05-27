import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/delete_todo_list/delete_todo_list_entity.dart';
import '../../entities/entity.dart';
import '../use_case.dart';

abstract class DeleteTodoUseCase
    extends UseCase<EmptyEntity, DeleteTodoEntity> {
  @override
  Future<Either<Failure, EmptyEntity>> call(DeleteTodoEntity params);
}
