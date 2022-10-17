// To parse this JSON data, do
//
//     final habitModel = habitModelFromJson(jsonString);

import 'dart:convert';

HabitModel habitModelFromJson(String str) =>
    HabitModel.fromJson(json.decode(str));

String habitModelToJson(HabitModel data) =>
    json.encode(data.toJson(data.habitId.toString()));

class HabitModel {
  HabitModel({this.uid, this.habitId, this.habitName, this.isCompleted});

  String? uid;
  String? habitId;
  String? habitName;
  bool? isCompleted;

  factory HabitModel.fromJson(Map<String, dynamic> json) => HabitModel(
        uid: json["uid"],
        habitId: json["habitId"],
        habitName: json["habitName"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson(String id) => {
        "uid": uid,
        "habitId": id,
        "habitName": habitName,
        "isCompleted": false,
      };
}
