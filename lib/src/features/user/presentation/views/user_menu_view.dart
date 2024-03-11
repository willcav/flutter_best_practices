import 'package:flutter/material.dart';

import '../user_page_state.dart';

class UserMenuView extends StatelessWidget {
  final UserPageMenuState state;

  const UserMenuView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: state.onSuccessTap,
            child: Text(state.successButtonLabel),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: state.onErrorTap,
            child: Text(state.errorButtonLabel),
          ),
        ],
      ),
    );
  }
}
