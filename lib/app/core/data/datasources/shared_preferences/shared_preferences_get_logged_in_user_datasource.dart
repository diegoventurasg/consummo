import '../../../domain/entities/logged_in_user_entity.dart';
import '../../dtos/logged_in_user_dto.dart';
import '../../storages/shared_preferences/repositories/user_repository.dart';
import '../get_logged_in_user_datasource.dart';

class SharedPreferencesGetLoggedInUserDatasource
    implements IGetLoggedInUserDatasource {
  final UserRepositoryDao prefs;

  SharedPreferencesGetLoggedInUserDatasource(this.prefs);

  @override
  Future<LoggedInUserEntity?> call() async {
    final userMap = await prefs.getLoggedInUser();
    if (userMap == null) return null;

    final user = LoggedInUserDto.fromMap(userMap);
    return user;
  }
}
