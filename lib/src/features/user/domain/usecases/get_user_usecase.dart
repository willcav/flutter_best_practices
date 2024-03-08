import 'package:core/core.dart';
import '../entities/user_entity.dart';
import '../interfaces/get_user_repository.dart';

class GetUserUseCase {
  final GetUserRepository repository;

  GetUserUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call() => repository.getUser();
}
