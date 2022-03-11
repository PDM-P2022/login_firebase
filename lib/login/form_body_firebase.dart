import 'package:app_firebase/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../utils/secrets.dart';

class FormBodyFirebase extends StatelessWidget {
  FormBodyFirebase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      showAuthActionSwitch: false, // disable navigate to register screen
      headerBuilder: (context, constraints, breakpoint) {
        return Text("Header");
      },
      providerConfigs: [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: GOOGLE_CLIENT_ID),
      ],
      footerBuilder: (context, action) {
        return Text(
          'By signing in, you agree to our terms and conditions.',
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }),
      ],
    );
  }
}
