import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_builder_app/helper/notification_helper.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_icon_button.dart';
import '../../../../elements/custom_text.dart';
import 'layout/body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    NotificationHelper().requestPermission(); // call this method in main
    NotificationHelper().getToken(); // call  this method in signup screen
    NotificationHelper().initializeInfo(); // call this method in main
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: FrontEndConfigs.kScaffoldBGColor,
        elevation: 0,
        title: const CustomText(
          text: 'Homepage',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 5),
          child:
              CustomIconButton(onPressed: () {}, icon: Icons.dehaze_outlined),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                DocumentSnapshot snap = await FirebaseFirestore.instance
                    .collection("userTokens")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get();
                String token = snap["token"];
                NotificationHelper().sendPushNotification(
                    token: token, title: 'Push Notification', body: 'BY CODE');
                debugPrint('notification sent');
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
