import 'package:flutter/material.dart';
import 'package:core/core.dart';
import '../../../settings/theme_widget.dart';
import 'user_page_state.dart';
import 'user_viewmodel.dart';
import 'views/user_error_view.dart';
import 'views/user_loading_view.dart';
import 'views/user_menu_view.dart';
import 'views/user_success_view.dart';
import '../../../utils/presentation_extensions.dart';

class UserPage extends StatefulWidget {
  static const routeName = '/user-page';

  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SL.I<UserViewModel>();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            viewModel.state.observer(
              builder: (_, state, __) {
                return switch (state) {
                  UserPageMenuState() => UserMenuView(state),
                  UserPageSuccessState() => UserSuccessView(state),
                  UserPageErrorState() => UserErrorView(state),
                  UserPageLoadingState() => UserLoadingView(state),
                };
              },
            ),
            const ThemeWidget(),
          ],
        ),
      ),
    );
  }
}
