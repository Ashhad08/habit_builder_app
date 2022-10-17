import 'package:flutter/material.dart';
import 'package:habit_builder_app/backend/models/habit_model.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_icon_button.dart';
import '../../../../elements/custom_text.dart';
import 'layout/body.dart';

class HabitDetailsView extends StatelessWidget {
  const HabitDetailsView(this._habitModel, {Key? key}) : super(key: key);
  final HabitModel _habitModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: FrontEndConfigs.kScaffoldBGColor,
        elevation: 0,
        title: CustomText(
          text: _habitModel.habitName ?? '',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 5),
          child: CustomIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 8, bottom: 5),
            child:
                CustomIconButton(onPressed: () {}, icon: Icons.edit_outlined),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: HabitDetailsViewBody(_habitModel),
    );
  }
}
