import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_error_handling/src/presentation/errors/ui_error/ui_error.dart';

import '../domain/entities/user_entity.dart';
import 'user_presenter.dart';

class UserPage extends StatelessWidget {
  static const routeName = '/user-page';

  final UserPresenter presenter;
  const UserPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<UserEntity>(
              future: presenter.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    (snapshot.error as UIError).message,
                    style: const TextStyle(fontSize: 24),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: NetworkImage(snapshot.data!.avatarPicture),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        snapshot.data!.name,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  );
                }

                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
