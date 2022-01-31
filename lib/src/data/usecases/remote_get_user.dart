import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch_error_handling/src/data/errors/http/http_error.dart';
import 'package:flutter_clean_arch_error_handling/src/data/http/http_client.dart';
import 'package:flutter_clean_arch_error_handling/src/data/models/user_model.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/entities/user_entity.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/errors/domain_error.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/usecases/get_user_usecase.dart';

class RemoteGetUser extends GetUserUseCase {
  final mockUser = const UserEntity(id: '1', name: 'John Doe');

  final HttpClient client;
  final String url;

  RemoteGetUser({
    required this.client,
    required this.url,
  });

  @override
  Future<UserEntity> call() async {
    try {
      final result = await client.request(url: url, method: RequestMethod.get);

      final map = (result as List).isNotEmpty ? result[0] : <String, dynamic>{};

      return UserModel.fromMap(map);
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
