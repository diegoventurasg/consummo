import 'package:dartz/dartz.dart';

import '../../domain/entities/logged_in_user_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/set_logged_in_user_repository.dart';
import '../datasources/set_logged_in_user_datasource.dart';

class SetLoggedInUserRepositoryImpl implements ISetLoggedInUserRepository {
  final ISetLoggedInUserDatasource datasource;

  SetLoggedInUserRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> setLoggedInUser(LoggedInUserEntity user) async {
    try {
      final isUserSetted = await datasource(user);
      return isUserSetted ? right(isUserSetted) : left(InternalError());
    } catch (e) {
      return left(InternalError());
    }
  }
}
