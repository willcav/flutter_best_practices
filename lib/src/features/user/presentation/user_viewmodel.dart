import 'package:flutter/foundation.dart';
import '../domain/usecases/get_user_usecase.dart';
import 'user_page_state.dart';
import '../../../utils/presentation_extensions.dart';

class UserViewModel {
  final GetUserUseCase getUserUseCase;

  UserViewModel({
    required this.getUserUseCase,
  });

  final _state = ValueNotifier<UserPageState>(UserPageLoadingState());

  ValueListenable<UserPageState> get state => _state;

  Future<void> fetchUserData() async {
    _state.setValue(UserPageLoadingState());

    final result = await getUserUseCase();

    _state.setValue(result.fold(
      (failure) => UserPageErrorState(failure.message ?? ''),
      (user) => UserPageSuccessState(
        name: user.name,
        avatarPath: user.avatarPicture,
      ),
    ));
  }
}
