import 'package:flutter/material.dart';

import 'package:core/core.dart';
import '../../../utils/presentation_extensions.dart';
import 'dogs_page_states.dart';
import 'dogs_viewmodel.dart';
import 'views/dogs_error_view.dart';
import 'views/dogs_loading_view.dart';
import 'views/dogs_success_view.dart';

class DogsPage extends StatefulWidget {
  static const routeName = '/dogs-page';
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  late final DogsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SL.I<DogsViewModel>();
    viewModel.getDogsTemplateUsecase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            viewModel.state.observer(
              builder: (_, state, __) {
                return switch (state) {
                  DogsPageErrorState() => DogsErrorView(state),
                  DogsPageLoadingState() => DogsLoadingView(state),
                  DogsPageSuccessState() => DogsSuccessView(state),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
