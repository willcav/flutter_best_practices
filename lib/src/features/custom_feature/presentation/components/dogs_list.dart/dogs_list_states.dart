import 'dart:ui';

import '../../../domain/entities/dog.dart';

sealed class DogsListState {}

class DogsListSuccessState extends DogsListState {
  final List<Dog> dogs;

  DogsListSuccessState({
    required this.dogs,
  });
}

class DogsListErrorState extends DogsListState {
  final String errorMessage;
  final VoidCallback onTryAgainTap;

  DogsListErrorState({
    required this.onTryAgainTap,
    required this.errorMessage,
  });
}

class DogsListLoadingState extends DogsListState {}