import 'package:core/core.dart';
import '../entities/user_entity.dart';

abstract interface class GetUserRepository {
  Future<Either<Failure, UserEntity>> getUser();
}
