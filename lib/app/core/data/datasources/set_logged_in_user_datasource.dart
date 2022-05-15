import '../../domain/entities/logged_in_user_entity.dart';

abstract class ISetLoggedInUserDatasource {
  Future<bool> call(LoggedInUserEntity user);
}
