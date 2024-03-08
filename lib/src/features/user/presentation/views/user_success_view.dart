import 'package:flutter/material.dart';
import '../user_page_state.dart';

class UserSuccessView extends StatelessWidget {
  final UserPageSuccessState state;

  const UserSuccessView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state.avatarPath != null)
            CircleAvatar(
              maxRadius: 40,
              backgroundImage: NetworkImage(state.avatarPath!),
            ),
          const SizedBox(
            height: 24,
          ),
          Text(
            state.name,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
