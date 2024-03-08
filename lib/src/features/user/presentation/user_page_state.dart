sealed class UserPageState {}

class UserPageSuccessState extends UserPageState {
  final String name;
  final String? avatarPath;

  UserPageSuccessState({
    required this.name,
    this.avatarPath,
  });
}

class UserPageErrorState extends UserPageState {
  final String errorMessage;

  UserPageErrorState(this.errorMessage);
}

class UserPageLoadingState extends UserPageState {}
