import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mangemant/screen/auth_screen/login_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        backgroundColor: Colors.blue.shade100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  20.0,),
                bottomRight: Radius.circular(20.0))),
        child: Wrap(
          runSpacing: 10,
          children: [
            StreamBuilder(stream: _firestore.collection("users").snapshots(),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text("${snapshot.data!.docs[0]['username']}", style: const TextStyle(),),
                        subtitle: Text('${snapshot.data!.docs[0]['email']}', style: const TextStyle()),
                        leading: const CircleAvatar(
                          radius: 22.0,
                          backgroundColor: Colors.blue,
                          child: Text("U", style: TextStyle()),
                        ),
                      ),
                    );

                  }

                  return Container();
                }),
            const Divider(color: Colors.black,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    Get.to(() => const SignInScreen());
                  });
                },
                child: const Row(
                  children: [
                    Text("Log Out", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,

                    ),),
                    SizedBox(width: 20,),
                    Icon(Icons.logout_outlined)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}