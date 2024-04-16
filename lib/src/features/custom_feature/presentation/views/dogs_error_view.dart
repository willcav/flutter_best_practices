import 'package:flutter/material.dart';

import '../dogs_page_states.dart';

class DogsErrorView extends StatelessWidget {
  final DogsPageErrorState state;
  const DogsErrorView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: state.onTryAgainTap,
            child: const Text('Try Again'),
          )
        ],
      ),
    ); 
  }
}