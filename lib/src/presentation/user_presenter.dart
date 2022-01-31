import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/entities/user_entity.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/errors/domain_error.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/usecases/get_user_usecase.dart';
import 'package:flutter_clean_arch_error_handling/src/presentation/errors/ui_error/ui_error.dart';
import 'package:flutter_clean_arch_error_handling/src/ui/user_presenter.dart';

class UserPresenterImpl implements UserPresenter {
  final GetUserUseCase getUserUseCase;

  UserPresenterImpl({
    required this.getUserUseCase,
  });

  @override
  Future<UserEntity> getUser() async {
    try {
      return await getUserUseCase.call();
    } on DomainError catch (e) {
      debugPrint(e.toString());
      throw e.toUIError();
    }
  }
}
