import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/user_entity.dart';
import '../repositories/add_user_repository.dart';

abstract class IAddUserUseCase {
  Future<Either<Failure, int>> call({required UserEntity user});
}

class AddUserUseCaseImpl implements IAddUserUseCase {
  final IAddUserRepository repository;

  AddUserUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, int>> call({required UserEntity user}) {
    return repository(user: user);
  }
}
