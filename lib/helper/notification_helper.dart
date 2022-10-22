import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationDetails _notificationDetails(
      AndroidNotificationDetails androidNotificationDetails) {
    return NotificationDetails(
        android: androidNotificationDetails,
        iOS: const DarwinNotificationDetails());
  }

  AndroidNotificationDetails _androidNotificationDetails(
      BigTextStyleInformation bigTextStyleInformation) {
    return AndroidNotificationDetails(
      'habitbuilder', 'habitbuilder ', importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.high,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification')
    );
  }

  BigTextStyleInformation _bigTextStyleInformation(RemoteMessage? message) {
    return BigTextStyleInformation(message!.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true);
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User Granted Permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User Granted Provisional Permission');
    } else {
      debugPrint('User declined or dose not accepted permission');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      debugPrint('Current Device Token is : $token');
      _uploadTokenToFirebase(token!);
    });
  }

  void _uploadTokenToFirebase(String token) async {
    await FirebaseFirestore.instance
        .collection("userTokens")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"token": token});
  }

  Future<void> scheduleNotification(
    int id,
    String title,
    String body,
    // DateTime eventDate, TimeOfDay eventTime,
    // String payload,
    // [DateTimeComponents? dateTimeComponents]
  ) async {
    // final scheduledTime = eventDate.add(Duration(
    //   hours: eventTime.hour,
    //   minutes: eventTime.minute,
    // ));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(DateTime.now().add(Duration(seconds: 20)), tz.local),
      const NotificationDetails(
          android: AndroidNotificationDetails(
            'habitbuilder',
            'habitbuilder ',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
          iOS: DarwinNotificationDetails()),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      // payload: payload,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  initializeInfo() {
    var initializationSettings = const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings());
    tz.initializeTimeZones();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (response) async {
      try {
        if (response.payload!.isNotEmpty && response.payload != null) {
          /// when notification is open this will happen
        } else {}
      } catch (e) {
        debugPrint(e.toString());
      }
      return;
    });

    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) async {
        await flutterLocalNotificationsPlugin.show(
            0,
            message!.notification!.title,
            message.notification!.body,
            _notificationDetails(
                _androidNotificationDetails(_bigTextStyleInformation(message))),
            payload: message.data["body"]);
      },
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          _notificationDetails(
              _androidNotificationDetails(_bigTextStyleInformation(message))),
          payload: message.data["body"]);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          _notificationDetails(
              _androidNotificationDetails(_bigTextStyleInformation(message))),
          payload: message.data["body"]);
    });
  }

  void sendPushNotification(
      {required String token,
      required String title,
      required String body}) async {
    int time =
        Timestamp.fromDate(DateTime.now().add(const Duration(minutes: 10)))
            .seconds;
    debugPrint(time.toString());
    try {
      http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization":
                "key=AAAAFjL3L_8:APA91bH8q69V-7vWbq6hAagEClmLJ7YP_oMILrZrmk8TgCNFIId6D63BhbRcLY1wjCRi-ROWVFC-Lj-tK-3lrZqewtM_yJbbZH_sghkdpWmxdXTFZa2lzLaXGBsk3gPQO-YHcz3mW_AZ"
          },
          body: jsonEncode(<String, dynamic>{
            "to": token,
            "notification": {
              "body": body,
              "title": title,
              "android_channel_id": "habitbuilder",
              "click_action": "FLUTTER_NOTIFICATION_CLICK",
              "event_time": time,
              "sound": true
            },
            "priority": "high",
            "data": <String, dynamic>{
              "click_action": "FLUTTER_NOTIFICATION_CLICK",
              "status": "done",
              "event_time": time,
              "body": body,
              "title": title
            }
          }));
    } catch (e) {
      debugPrint("sendPushNotificationError :${e.toString()}");
    }
  }
}
