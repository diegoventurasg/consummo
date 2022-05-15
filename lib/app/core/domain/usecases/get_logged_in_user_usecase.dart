import 'package:dartz/dartz.dart';

import '../../../core/domain/entities/logged_in_user_entity.dart';
import '../../../core/domain/errors/errors.dart';
import '../../../core/domain/repositories/get_logged_in_user_repository.dart';

abstract class IGetLoggedInUserUseCase {
  Future<Either<Failure, LoggedInUserEntity>> call();
}

class GetLoggedInUserUseCaseImpl implements IGetLoggedInUserUseCase {
  final IGetLoggedInUserRepository repository;

  GetLoggedInUserUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, LoggedInUserEntity>> call() {
    return repository.getLoggedInUser();
  }
}
