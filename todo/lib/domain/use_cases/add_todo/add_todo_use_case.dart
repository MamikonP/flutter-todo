import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/add_todo_list/add_todo_list_entity.dart';
import '../../entities/entity.dart';
import '../use_case.dart';

abstract class AddTodoUseCase extends UseCase<EmptyEntity, AddTodoListEntity> {
  @override
  Future<Either<Failure, EmptyEntity>> call(AddTodoListEntity params);
}
