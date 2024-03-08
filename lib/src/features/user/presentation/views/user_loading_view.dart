import 'package:flutter/material.dart';
import '../user_page_state.dart';

class UserLoadingView extends StatelessWidget {
  final UserPageLoadingState state;

  const UserLoadingView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
