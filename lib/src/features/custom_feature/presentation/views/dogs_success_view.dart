import 'package:flutter/material.dart';

import '../../domain/entities/dog_template.dart';
import '../components/dogs_list.dart/dogs_list_component.dart';
import '../dogs_page_states.dart';

class DogsSuccessView extends StatelessWidget {
  final DogsPageSuccessState state;

  const DogsSuccessView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _BuildSection(state.dogsTemplate.mainSection),
          const DogsListComponent(),
          const SizedBox(
            height: 16,
          ),
          _BuildSection(state.dogsTemplate.secondarySection),
          const Text('Other widgets here'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class _BuildSection extends StatelessWidget {
  final DogsSection section;

  const _BuildSection(this.section);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          section.subtitle,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}