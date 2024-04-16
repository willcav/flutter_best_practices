import 'package:flutter/foundation.dart';

import '../../../../../utils/presentation_extensions.dart';
import '../../../domain/usecases/get_dogs_usecase.dart';
import 'dogs_list_states.dart';

class DogsListController {
  final GetDogsUseCase _getDogsUseCase;

  DogsListController(this._getDogsUseCase);

  final _state = ValueNotifier<DogsListState>(DogsListLoadingState());

  ValueListenable<DogsListState> get state => _state;

  void fetchDogs() async {
    _state.setValue(DogsListLoadingState());

    final result = await _getDogsUseCase();

    result.fold(
      (failure) => _state.value = DogsListErrorState(
        errorMessage: failure.message ?? '',
        onTryAgainTap: fetchDogs,
      ),
      (dogs) => _state.value = DogsListSuccessState(dogs: dogs),
    );
  }

}