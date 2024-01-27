import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:task_mangemant/models/task_controller.dart';

class TaskDetailsScreen extends StatefulWidget {
  final AddTaskModel addTaskModel;
   const TaskDetailsScreen({super.key, required this.addTaskModel});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  // Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //Check Box
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;



  @override
  void initState() {
    super.initState();
    getSwitchValue1().then((value) {
      setState(() {
        _isChecked1 = value;
      });
    });
    getSwitchValue2().then((value) {
      setState(() {
        _isChecked2 = value;
      });
    });
    getSwitchValue3().then((value) {
      setState(() {
        _isChecked3 = value;
      });
    });
    getSwitchValue4().then((value) {
      setState(() {
        _isChecked4 = value;
      });
    });
    getSwitchValue5().then((value) {
      setState(() {
        _isChecked5 = value;
      });
    });
  }

  Future<void> setSwitchValue1( bool value) async {
    await _firestore.collection('task').
    doc(_auth.currentUser!.uid).
    collection('multiTask').
    doc(widget.addTaskModel.taskID).
    update({
      'bTask1' : value

    });
  }
  Future<bool> getSwitchValue1() async {
    DocumentSnapshot snapshot =
    await _firestore.collection('task')
        .doc(_auth.currentUser!.uid).collection('multiTask')
        .doc(widget.addTaskModel.taskID).get();
    return snapshot.exists ? snapshot['bTask1'] : false;
  }

  Future<void> setSwitchValue2( bool value) async {
    await _firestore.collection('task').
    doc(_auth.currentUser!.uid).
    collection('multiTask').
    doc(widget.addTaskModel.taskID).
    update({
      'bTask2' : value

    });
  }
  Future<bool> getSwitchValue2() async {
    DocumentSnapshot snapshot =
    await _firestore.collection('task')
        .doc(_auth.currentUser!.uid).collection('multiTask')
        .doc(widget.addTaskModel.taskID).get();
    return snapshot.exists ? snapshot['bTask2'] : false;
  }

  Future<void> setSwitchValue3( bool value) async {
    await _firestore.collection('task').
    doc(_auth.currentUser!.uid).
    collection('multiTask').
    doc(widget.addTaskModel.taskID).
    update({
      'bTask3' : value

    });
  }
  Future<bool> getSwitchValue3() async {
    DocumentSnapshot snapshot =
    await _firestore.collection('task')
        .doc(_auth.currentUser!.uid).collection('multiTask')
        .doc(widget.addTaskModel.taskID).get();
    return snapshot.exists ? snapshot['bTask3'] : false;
  }

  Future<void> setSwitchValue4( bool value) async {
    await _firestore.collection('task').
    doc(_auth.currentUser!.uid).
    collection('multiTask').
    doc(widget.addTaskModel.taskID).
    update({
      'bTask4' : value

    });
  }
  Future<bool> getSwitchValue4() async {
    DocumentSnapshot snapshot =
    await _firestore.collection('task')
        .doc(_auth.currentUser!.uid).collection('multiTask')
        .doc(widget.addTaskModel.taskID).get();
    return snapshot.exists ? snapshot['bTask4'] : false;
  }

  Future<void> setSwitchValue5( bool value) async {
    await _firestore.collection('task').
    doc(_auth.currentUser!.uid).
    collection('multiTask').
    doc(widget.addTaskModel.taskID).
    update({
      'bTask5' : value

    });
  }
  Future<bool> getSwitchValue5() async {
    DocumentSnapshot snapshot =
    await _firestore.collection('task')
        .doc(_auth.currentUser!.uid).collection('multiTask')
        .doc(widget.addTaskModel.taskID).get();
    return snapshot.exists ? snapshot['bTask5'] : false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
        title: const Text("Task Details"),
      ),
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(widget.addTaskModel.calnderDate,style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400
              ),)),
              const SizedBox(height: 10,),
              const Text('Task Title',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Text(widget.addTaskModel.taskTitle,style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
              ),
              const SizedBox(height: 15,),
              const Text('Task One',style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Text(widget.addTaskModel.task1,style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  MSHCheckbox(
                    size: 45,
                    value: _isChecked1,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.blue,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) async {

                      double incrementValue = selected ? 0.200000000 : -0.200000000;

                      _firestore.collection('task').
                      doc(_auth.currentUser!.uid).
                      collection('multiTask').
                      doc(widget.addTaskModel.taskID).
                      update({
                        'taskProg' : FieldValue.increment(incrementValue)
                      });

                      await  setSwitchValue1(selected);

                      setState(() {
                        _isChecked1 = selected;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text('Task Two',style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Text(widget.addTaskModel.task2,style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  MSHCheckbox(
                    size: 45,
                    value: _isChecked2,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.blue,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) async {
                      double incrementValue = selected ? 0.200000000 : -0.200000000;

                      _firestore.collection('task').
                      doc(_auth.currentUser!.uid).
                      collection('multiTask').
                      doc(widget.addTaskModel.taskID).
                      update({
                        'taskProg' : FieldValue.increment(incrementValue)
                      });

                      await  setSwitchValue2(selected);

                      setState(() {
                        _isChecked2 = selected;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text('Task Three',style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Text(widget.addTaskModel.task3,style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  MSHCheckbox(
                    size: 45,
                    value: _isChecked3,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.blue,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) async {
                      double incrementValue = selected ? 0.200000000 : -0.200000000;

                      _firestore.collection('task').
                      doc(_auth.currentUser!.uid).
                      collection('multiTask').
                      doc(widget.addTaskModel.taskID).
                      update({
                        'taskProg' : FieldValue.increment(incrementValue)
                      });

                      await  setSwitchValue3(selected);

                      setState(() {
                        _isChecked3 = selected;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text('Task Four',style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Text(widget.addTaskModel.task4,style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  MSHCheckbox(
                    size: 45,
                    value: _isChecked4,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.blue,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) async {
                      double incrementValue = selected ? 0.200000000 : -0.200000000;

                      _firestore.collection('task').
                      doc(_auth.currentUser!.uid).
                      collection('multiTask').
                      doc(widget.addTaskModel.taskID).
                      update({
                        'taskProg' : FieldValue.increment(incrementValue)
                      });

                      await  setSwitchValue4(selected);

                      setState(() {
                        _isChecked4 = selected;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text('Task Five',style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Text(widget.addTaskModel.task5,style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  MSHCheckbox(
                    size: 45,
                    value: _isChecked5,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.blue,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) async {
                      double incrementValue = selected ? 0.200000000 : -0.200000000;

                      _firestore.collection('task').
                      doc(_auth.currentUser!.uid).
                      collection('multiTask').
                      doc(widget.addTaskModel.taskID).
                      update({
                        'taskProg' : FieldValue.increment(incrementValue)
                      });

                      await  setSwitchValue5(selected);

                      setState(() {
                        _isChecked5 = selected;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text('Description',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(height: 8,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(11)
                ),
                child: Text(widget.addTaskModel.desc,style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
