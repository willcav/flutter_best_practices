import 'dart:ui';

sealed class UserPageState {}

class UserPageMenuState extends UserPageState {
  final String successButtonLabel;
  final String errorButtonLabel;
  final VoidCallback onSuccessTap;
  final VoidCallback onErrorTap;

  UserPageMenuState({
    required this.successButtonLabel,
    required this.errorButtonLabel,
    required this.onSuccessTap,
    required this.onErrorTap,
  });
}

class UserPageSuccessState extends UserPageState {
  final String name;
  final String? avatarPath;
  final VoidCallback onBackTap;

  UserPageSuccessState({
    required this.name,
    required this.onBackTap,
    this.avatarPath,
  });
}

class UserPageErrorState extends UserPageState {
  final String errorMessage;
  final VoidCallback onBackTap;

  UserPageErrorState({
    required this.onBackTap,
    required this.errorMessage,
  });
}

class UserPageLoadingState extends UserPageState {}
