import 'package:flutter_clean_arch_error_handling/src/domain/entities/user_entity.dart';

abstract class GetUserUseCase {
  Future<UserEntity> call();
}
