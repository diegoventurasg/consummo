import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/user_entity.dart';

abstract class IAddUserRepository {
  Future<Either<Failure, int>> call({required UserEntity user});
}
