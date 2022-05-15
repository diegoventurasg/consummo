import '../../domain/entities/logged_in_user_entity.dart';

abstract class IGetLoggedInUserDatasource {
  Future<LoggedInUserEntity?> call();
}
