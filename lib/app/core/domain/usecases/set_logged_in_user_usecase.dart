import 'package:dartz/dartz.dart';

import '../entities/logged_in_user_entity.dart';
import '../errors/errors.dart';
import '../repositories/set_logged_in_user_repository.dart';

abstract class ISetLoggedInUserUseCase {
  Future<Either<Failure, bool>> call(LoggedInUserEntity user);
}

class SetLoggedInUserUseCaseImpl implements ISetLoggedInUserUseCase {
  final ISetLoggedInUserRepository repository;

  SetLoggedInUserUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(LoggedInUserEntity user) {
    return repository.setLoggedInUser(user);
  }
}
