import 'package:flutter_clean_arch_error_handling/src/domain/entities/user_entity.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/usecases/get_user_usecase.dart';

class RemoteGetUser extends GetUserUseCase {
  final mockUser = const UserEntity(id: '1', name: 'John Doe');

  @override
  Future<UserEntity> call() async {
    try {
      return mockUser;
    } catch (e) {
      throw Exception();
    }
  }
}
