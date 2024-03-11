import 'package:core/core.dart';
import 'interfaces/user_datasource.dart';
import 'models/user_model.dart';
import '../domain/entities/user_entity.dart';
import '../domain/interfaces/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final UserDatasource userDatasource;

  GetUserRepositoryImpl(this.userDatasource);

  @override
  Future<Either<Failure, UserEntity>> getUser(
      {bool simulateError = false}) async {
    final result = await userDatasource.getUser(simulateError: simulateError);

    if (result.isLeft) return Left(result.left);

    final user = UserModel.fromMap(result.right.jsonListData.first);

    return Right(user);
  }
}
