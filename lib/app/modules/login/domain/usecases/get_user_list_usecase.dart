import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/user_entity.dart';
import '../repositories/get_user_list_repository.dart';

abstract class IGetUserListUseCase {
  Future<Either<Failure, List<UserEntity>>> call();
}

class GetUserListUseCaseImpl implements IGetUserListUseCase {
  final IGetUserListRepository repository;

  GetUserListUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call() {
    return repository();
  }
}
