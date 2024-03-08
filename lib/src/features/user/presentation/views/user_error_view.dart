import 'package:flutter/material.dart';
import '../user_page_state.dart';

class UserErrorView extends StatelessWidget {
  final UserPageErrorState state;

  const UserErrorView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        state.errorMessage,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
