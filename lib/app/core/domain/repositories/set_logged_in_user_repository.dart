import 'package:dartz/dartz.dart';

import '../entities/logged_in_user_entity.dart';
import '../errors/errors.dart';

abstract class ISetLoggedInUserRepository {
  Future<Either<Failure, bool>> setLoggedInUser(LoggedInUserEntity user);
}
