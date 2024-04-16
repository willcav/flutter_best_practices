import 'package:flutter/material.dart';

import '../dogs_list_states.dart';

class DogsListComponentErrorWidget extends StatelessWidget {
  final DogsListErrorState state;
  const DogsListComponentErrorWidget(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.errorMessage),
    );
  }
}