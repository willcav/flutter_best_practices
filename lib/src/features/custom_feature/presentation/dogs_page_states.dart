import 'dart:ui';

import '../domain/entities/dog_template.dart';

sealed class DogsPageState {}

class DogsPageSuccessState extends DogsPageState {
  final DogsTemplate dogsTemplate;

  DogsPageSuccessState({
    required this.dogsTemplate,
  });
}

class DogsPageErrorState extends DogsPageState {
  final String errorMessage;
  final VoidCallback onTryAgainTap;

  DogsPageErrorState({
    required this.onTryAgainTap,
    required this.errorMessage,
  });
}

class DogsPageLoadingState extends DogsPageState {}