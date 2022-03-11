import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../login/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      // no providerConfigs property here as well
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }),
      ],
      providerConfigs: [],
    );
  }
}
