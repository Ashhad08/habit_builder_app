// To parse this JSON data, do
//
//     final reminderModel = reminderModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ReminderModel reminderModelFromJson(String str) =>
    ReminderModel.fromJson(json.decode(str));

String reminderModelToJson(ReminderModel data) => json.encode(data.toJson());

class ReminderModel {
  ReminderModel({
    required this.time,
    required this.status,
    this.isCompleted,
  });

  Timestamp time;
  bool status;
  bool? isCompleted;

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
        time: json["time"],
        status: json["status"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "status": true,
        "isCompleted": false,
      };
}
