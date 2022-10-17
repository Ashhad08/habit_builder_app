import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_builder_app/backend/models/habit_model.dart';
import 'package:habit_builder_app/backend/models/user_model.dart';

import '../models/reminder_model.dart';

class SystemServices {
  Future createUser({required UserModel userModel}) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJson(), SetOptions(merge: true));
  }

  Future createHabit(
      HabitModel habitModel, List<ReminderModel> reminders) async {
    DocumentReference habitDocRef =
        FirebaseFirestore.instance.collection("habits").doc();
    return await habitDocRef
        .set(habitModel.toJson(habitDocRef.id), SetOptions(merge: true))
        .then((value) {
      reminders.forEach((element) async {
        return await FirebaseFirestore.instance
            .collection("habits")
            .doc(habitDocRef.id)
            .collection("Reminders")
            .doc()
            .set(element.toJson(), SetOptions(merge: true));
      });
    });
  }

  Future markHabitAsCompleted(String habitId) async {
    return await FirebaseFirestore.instance
        .collection("habits")
        .doc(habitId)
        .update({
      "isCompleted": true,
    });
  }

  Stream<List<HabitModel>> fetchCurrentUserActiveHabits() {
    return FirebaseFirestore.instance
        .collection("habits")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isCompleted", isEqualTo: false)
        .snapshots()
        .map((allHabits) => allHabits.docs
            .map((singleHabit) => HabitModel.fromJson(singleHabit.data()))
            .toList());
  }
}
