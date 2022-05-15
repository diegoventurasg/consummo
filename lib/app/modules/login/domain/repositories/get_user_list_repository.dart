import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/user_entity.dart';

abstract class IGetUserListRepository {
  Future<Either<Failure, List<UserEntity>>> call();
}
