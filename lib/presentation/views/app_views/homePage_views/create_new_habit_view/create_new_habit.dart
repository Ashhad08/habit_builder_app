import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_floating_button.dart';
import '../../../../elements/custom_icon_button.dart';
import '../../../../elements/custom_switch.dart';
import '../../../../elements/custom_text.dart';
import 'widgets/frequency_details_container.dart';
import 'widgets/reminder_container.dart';
import 'widgets/show_time_picker_sheet.dart';
import 'widgets/start_new_habit_stack.dart';

class CreateNewHabitView extends StatefulWidget {
  const CreateNewHabitView({Key? key}) : super(key: key);

  @override
  State<CreateNewHabitView> createState() => _CreateNewHabitViewState();
}

class _CreateNewHabitViewState extends State<CreateNewHabitView> {
  bool notification = false;
  DateTime reminderTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: FrontEndConfigs.kScaffoldBGColor,
        elevation: 0,
        title: const CustomText(
          text: 'New Habit',
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
      ),
      body: _getBody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
          iconPath: 'assets/images/done.png', onPressed: () {}),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/Background.png'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              AuthTextField(
                  hintText: 'Enter habit name',
                  isPasswordField: false,
                  isPrefix: false,
                  height: 50,
                  fillColor: FrontEndConfigs.kWhiteColor),
              const SizedBox(
                height: 10,
              ),
              const FrequencyDetailsContainer(),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: FrontEndConfigs.kWhiteColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const CustomText(
                        text: 'Reminder',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    const Spacer(),
                    const CustomText(
                        text: '10:00AM',
                        fontSize: 14,
                        textColor: FrontEndConfigs.kPrimaryColor,
                        fontWeight: FontWeight.w700),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            barrierColor: Colors.black54,
                            context: context,
                            backgroundColor: FrontEndConfigs.kWhiteColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                            ),
                            builder: (context) {
                              bool reminder = false;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    height: 600,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        color: FrontEndConfigs.kWhiteColor),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 5,
                                                        childAspectRatio: 7 / 6,
                                                        mainAxisSpacing: 10),
                                                itemCount: 9,
                                                padding:
                                                    const EdgeInsets.all(20),
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return ReminderContainer(
                                                      value: reminder,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          reminder = val;
                                                        });
                                                      },
                                                      reminderTime: '06:30 AM');
                                                })),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: CustomButton(
                                              buttonText: 'Add Reminder',
                                              height: 60,
                                              width: double.infinity,
                                              onPressed: () {
                                                Navigator.pop(context);
                                                showModalBottomSheet(
                                                    barrierColor:
                                                        Colors.black54,
                                                    context: context,
                                                    builder: (context) {
                                                      return ShowTimePickerSheet(
                                                          onCancel: () {
                                                        Navigator.pop(context);
                                                      }, onSave: () {
                                                        Navigator.pop(context);
                                                      }, onTimeChanged:
                                                              (newTime) {
                                                        reminderTime = newTime;
                                                      });
                                                    });
                                              }),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: const SizedBox(
                        width: 25,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: FrontEndConfigs.kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: FrontEndConfigs.kWhiteColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const CustomText(
                        text: 'Notification',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    const Spacer(),
                    CustomSwitch(
                        value: notification,
                        onChanged: (val) {
                          setState(() {
                            notification = val;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const StartNewHabitStack()
            ],
          ),
        ),
      ),
    );
  }
}
