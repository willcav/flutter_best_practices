import 'package:flutter/foundation.dart';

import '../../../utils/presentation_extensions.dart';
import '../domain/usecases/get_dogs_template_usecase.dart';
import 'dogs_page_states.dart';

class DogsViewModel {
  final GetDogsTemplateUsecase getDogsTemplateUsecase;

  DogsViewModel(this.getDogsTemplateUsecase);

  final _state = ValueNotifier<DogsPageState>(DogsPageLoadingState());

  ValueListenable<DogsPageState> get state => _state;

  Future<void> fetchDogsTemplate() async {
    _state.setValue(DogsPageLoadingState());

    final result = await getDogsTemplateUsecase();

    _state.value = result.fold(
      (failure) => DogsPageErrorState(
        errorMessage: failure.message ?? '',
        onTryAgainTap: fetchDogsTemplate,
      ),
      (dogsTemplate) => DogsPageSuccessState(dogsTemplate: dogsTemplate),
    );
  }
}
