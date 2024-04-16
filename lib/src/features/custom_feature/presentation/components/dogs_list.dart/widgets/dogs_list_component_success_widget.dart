import 'package:flutter/material.dart';

import '../dogs_list_states.dart';

class DogsListComponentSuccessWidget extends StatelessWidget {
  final DogsListSuccessState state;

  const DogsListComponentSuccessWidget(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.dogs.length,
      itemBuilder: (context, index) {
        final dog = state.dogs[index];
        return ListTile(
          title: Text(dog.name),
          subtitle: Text(dog.breed),
        );
      },
    );
  }
}
