import 'package:flutter/material.dart';

import '../dogs_list_states.dart';

class DogsListComponentLoadingWidget extends StatelessWidget {
  final DogsListLoadingState state;
  const DogsListComponentLoadingWidget(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}