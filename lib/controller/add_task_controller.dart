import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task_mangemant/models/task_controller.dart';

class AddTaskController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(
      double taskprog,
      String taskTitle,
      String task1,
      String task2,
      String task3,
      String task4,
      String task5,
      String desc,
      String startDate,
      String endDate,
      String calnderDate,
      String taskID) async {
    AddTaskModel addTaskModel = AddTaskModel(
      taskProg: 0.0,
        calnderDate: calnderDate,
        desc: desc,
        endDate: endDate,
        startDate: startDate,
        task1: task1,
        task2: task2,
        task3: task3,
        task4: task4,
        task5: task5,
        taskID: taskID,
        taskTitle: taskTitle,
      bTask1: false,
      bTask2: false,
      bTask3: false,
      bTask4: false,
      bTask5: false
    );

    _firestore
        .collection('task')
        .doc(_auth.currentUser!.uid)
        .collection('multiTask')
        .doc(taskID)
        .set(addTaskModel.toMap());
  }

  String generateRandomCode() {
    Random random = Random();

    String randomDigits = '';
    for (int i = 0; i < 15; i++) {
      randomDigits += random.nextInt(10).toString();
    }

    String randomCode = "Task$randomDigits";

    return randomCode;
  }
}
