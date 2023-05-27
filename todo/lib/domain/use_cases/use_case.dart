import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/entity.dart';

abstract class UseCase<Type, Params extends Entity> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}
