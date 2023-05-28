import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/add_task/add_task_entity.dart';
import '../../entities/entity.dart';
import '../use_case.dart';

abstract class UpdateTaskUseCase extends UseCase<EmptyEntity, AddTaskEntity> {
  @override
  Future<Either<Failure, EmptyEntity>> call(AddTaskEntity params);
}
