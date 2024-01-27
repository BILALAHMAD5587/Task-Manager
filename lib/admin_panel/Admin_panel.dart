import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:task_mangemant/models/user_model.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade50,
        title: const Text("Admin"),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

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

          if(snapshot.data != null){
           return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index ){
                  final data = snapshot.data!.docs[index];
                  UserModel userModel = UserModel(
                      uId: data['uId'],
                      username: data['username'],
                      email: data['email'],
                      userDeviseToken: data['userDeviseToken'],
                      isAdmin: data['isAdmin'],
                      createdOn: data['createdOn']);

                  return SwipeActionCell(
                      key: ObjectKey(userModel.uId),
                      trailingActions: [
                        SwipeAction(
                            onTap: (CompletionHandler handler)async{
                              final CollectionReference userCollection =
                              FirebaseFirestore.instance.collection('users');


                              userCollection.doc(userModel.uId).delete();

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
                          leading: const CircleAvatar(
                            child: Text('U'),
                          ),
                          title: Text(userModel.username),
                          subtitle: Text(userModel.email),
                        ),
                      ));
                });
          }

          return Container();
        },
      ),
    );
  }
}