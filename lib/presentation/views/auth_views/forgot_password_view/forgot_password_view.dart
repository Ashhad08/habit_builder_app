import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_icon_button.dart';
import 'layout/body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: FrontEndConfigs.kScaffoldBGColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 5),
          child: CustomIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back),
        ),
      ),
      body: const ForgotPasswordViewBody(),
    );
  }
}
