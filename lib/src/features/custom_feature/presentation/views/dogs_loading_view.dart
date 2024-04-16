import 'package:flutter/material.dart';

import '../dogs_page_states.dart';

class DogsLoadingView extends StatelessWidget {
  final DogsPageLoadingState state;

  const DogsLoadingView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}