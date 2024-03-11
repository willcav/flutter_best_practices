import 'package:core/core.dart';
import '../data/interfaces/user_datasource.dart';

class UserDataSourceImpl implements UserDatasource {
  final Network networkService;

  UserDataSourceImpl(this.networkService);

  @override
  Future<Either<Failure, NetworkResponse>> getUser(
          {required bool simulateError}) =>
      networkService.get('user${simulateError ? '-error' : ''}',
          queryParameters: {'id': 2});
}
