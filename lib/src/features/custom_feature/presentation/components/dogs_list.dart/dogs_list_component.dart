import 'package:flutter/material.dart';

import 'package:core/core.dart';
import '../../../../../utils/presentation_extensions.dart';
import 'dogs_list_controller.dart';
import 'dogs_list_states.dart';
import 'widgets/dogs_list_component_error_widget.dart';
import 'widgets/dogs_list_component_loading_widget.dart';
import 'widgets/dogs_list_component_success_widget.dart';

class DogsListComponent extends StatefulWidget {
  const DogsListComponent({super.key});

  @override
  State<DogsListComponent> createState() => _DogsListComponentState();
}

class _DogsListComponentState extends State<DogsListComponent> {
  late final DogsListController controller;

  @override
  void initState() {
    super.initState();
    controller = SL.I<DogsListController>();
    controller.fetchDogs();
  }

  @override
  Widget build(BuildContext context) {
    return controller.state.observer(
      builder: (_, state, __) {
        return switch (state) {
          DogsListErrorState() => DogsListComponentErrorWidget(state),
          DogsListLoadingState() => DogsListComponentLoadingWidget(state),
          DogsListSuccessState() => DogsListComponentSuccessWidget(state),
        };
      },
    );
  }
}
