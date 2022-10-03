import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import 'layout/body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: GetStartedViewBody(),
    );
  }
}
