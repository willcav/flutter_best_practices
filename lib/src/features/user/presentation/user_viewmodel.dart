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

  Future<void> fetchUserDataWithError() => fetchUserData(true);

  Future<void> fetchUserDataWithSuccess() => fetchUserData(false);

  void init() {
    setMenuState();
  }

  @visibleForTesting
  Future<void> fetchUserData(bool simulateError) async {
    _state.setValue(UserPageLoadingState());

    final result = await getUserUseCase(simulateError);

    _state.setValue(
      result.fold(
        (failure) => UserPageErrorState(
          onBackTap: setMenuState,
          errorMessage: failure.message ?? '',
        ),
        (user) => UserPageSuccessState(
          name: user.name,
          onBackTap: setMenuState,
          avatarPath: user.avatarPicture,
        ),
      ),
    );
  }

  @visibleForTesting
  void onSuccessTap() {
    fetchUserData(false);
  }

  @visibleForTesting
  void onErrorTap() {
    fetchUserData(true);
  }

  @visibleForTesting
  void setMenuState() {
    _state.setValue(
      UserPageMenuState(
        successButtonLabel: 'Success request →',
        errorButtonLabel: 'Error request →',
        onSuccessTap: onSuccessTap,
        onErrorTap: onErrorTap,
      ),
    );
  }
}
