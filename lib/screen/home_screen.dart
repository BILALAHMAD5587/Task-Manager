import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_mangemant/models/task_controller.dart';
import 'package:task_mangemant/screen/add_task_screen.dart';
import 'package:task_mangemant/screen/task_details_screen.dart';

import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<Map<String, dynamic>> repeatingItems = [
    {
      'icon': Icons.list_alt,
      'color': Colors.red,
      'image': 'assets/images/fg_red.jpg',
      'bgimage': 'assets/images/bg_red.jpg'
    },
    {
      'icon': Icons.phone_android_sharp,
      'color': Colors.blue,
      'image': 'assets/images/fg_blue.jpg',
      'bgimage': 'assets/images/bg_blue.jpg'
    },
    {
      'icon': Icons.home_filled,
      'color': Colors.green,
      'image': 'assets/images/fg_green.jpg',
      'bgimage': 'assets/images/bg_green.jpg'
    },
    {
      'icon': Icons.computer,
      'color': Colors.yellow,
      'image': 'assets/images/fg_yallow.jpg',
      'bgimage': 'assets/images/bg_yaalow.jpg'
    },
    {
      'icon': Icons.grade,
      'color': Colors.orange,
      'image': 'assets/images/fg_orange.jpg',
      'bgimage': 'assets/images/bg_orang.jpg'
    },
  ];

  final List<Color> repeatingColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];
  final List<Color> repeatingColorIcons = [
    Colors.red.shade50,
    Colors.blue.shade50,
    Colors.green.shade50,
    Colors.yellow.shade50,
    Colors.orange.shade50,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade50,
        ),
        drawer: const DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTaskScreen(),
                ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 29,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.10))),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(0.10),
                        ),
                        hintText: "Search recent task",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.10),
                            fontSize: 14)),
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                const Text(
                  "Select Task Categorias",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height / 40,
                ),
                SizedBox(
                  height: height / 3,
                  //width: double.infinity,
                  //color: Colors.blue.shade100,
                  child: categores()
                  ,
                ),
                SizedBox(
                  height: height / 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Task",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          'See all',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.blue,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                SizedBox(
                  height: height / 2.8,
                  //width: double.infinity,
                  //color: Colors.blue.shade100,
                  child: listTask()
                  ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categores() {
    return StreamBuilder(
        stream: _firestore
            .collection('task')
            .doc(_auth.currentUser!.uid)
            .collection('multiTask')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: Get.height / 5,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No Task Added!",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            );
          }

          if (snapshot.data != null) {
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item =
                      repeatingItems[index % repeatingItems.length];
                  final data = snapshot.data!.docs[index];
                  AddTaskModel addTaskModel = AddTaskModel(
                      calnderDate: data['calnderDate'],
                      desc: data['desc'],
                      endDate: data['endDate'],
                      startDate: data['startDate'],
                      task1: data['task1'],
                      task2: data['task2'],
                      task3: data['task3'],
                      task4: data['task4'],
                      task5: data['task5'],
                      taskID: data['taskID'],
                      taskTitle: data['taskTitle'],
                      taskProg: data['taskProg'],
                    bTask1: data['bTask1'],
                    bTask2: data['bTask2'],
                    bTask3: data['bTask3'],
                    bTask4: data['bTask4'],
                    bTask5: data['bTask5'],);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: height / 3.2,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                          //color: item['color'],
                          image: DecorationImage(
                              image: AssetImage(item['bgimage']),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(18)),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20, left: 10, bottom: 22),
                            child: Text(
                              addTaskModel.taskTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: height / 4,
                              width: width / 3,
                              //color: Colors.yellow,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(item['image']),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }

          return Container();
        });
  }

  Widget listTask() {
    return StreamBuilder(
        stream: _firestore
            .collection('task')
            .doc(_auth.currentUser!.uid)
            .collection('multiTask')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: Get.height / 5,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No Task Added!",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            );
          }

          if (snapshot.data != null) {
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Color color =
                      repeatingColorIcons[index % repeatingColorIcons.length];
                  Map<String, dynamic> item =
                      repeatingItems[index % repeatingItems.length];
                  final data = snapshot.data!.docs[index];
                  AddTaskModel addTaskModel = AddTaskModel(
                      calnderDate: data['calnderDate'],
                      desc: data['desc'],
                      endDate: data['endDate'],
                      startDate: data['startDate'],
                      task1: data['task1'],
                      task2: data['task2'],
                      task3: data['task3'],
                      task4: data['task4'],
                      task5: data['task5'],
                      taskID: data['taskID'],
                      taskTitle: data['taskTitle'],
                      taskProg: data['taskProg'],
                  bTask1: data['bTask1'],
                    bTask2: data['bTask2'],
                    bTask3: data['bTask3'],
                    bTask4: data['bTask4'],
                    bTask5: data['bTask5'],
                  );
                  return  SwipeActionCell(
                      key: ObjectKey(addTaskModel.taskID),
                      trailingActions: [
                        SwipeAction(
                          onTap: (CompletionHandler handler)async{
                            _firestore
                                .collection('task')
                                .doc(_auth.currentUser!.uid)
                                .collection('multiTask')
                                .doc(addTaskModel.taskID)
                                .delete();
                          },
                          color: Colors.blue.shade50,
                          title: 'Delete',
                            performsFirstActionWithFullSwipe: true)
                      ],
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 5,
                        color: Colors.blue.shade100,
                        child: ListTile(
                          onTap: () {
                            Get.to(() => TaskDetailsScreen(
                              addTaskModel: addTaskModel,
                            ));
                          },
                          leading: Container(
                            height: height / 15,
                            width: width / 7,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(
                                item['icon'],
                                color: item['color'],
                              ),
                            ),
                          ),
                          title: Text(
                            addTaskModel.calnderDate,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.30),
                            ),
                          ),
                          subtitle: Text(
                            addTaskModel.taskTitle,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          trailing: CircularPercentIndicator(
                            radius: 20.0,
                            lineWidth: 3.0,
                            animation: true,
                            percent: addTaskModel.taskProg,
                            center: Text(
                              "${double.parse(addTaskModel.taskProg.toStringAsFixed(1))}0%",
                              style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: item['color'],
                          ),
                        ),
                      ));
                });
          }

          return Container();
        });
  }

}

