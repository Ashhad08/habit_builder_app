import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../elements/custom_icon_button.dart';
import 'layout/body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: CupertinoIcons.question,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: LoginViewBody(),
    );
  }
}
