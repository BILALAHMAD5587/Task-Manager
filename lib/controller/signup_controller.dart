import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_mangemant/models/user_model.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signUpMethod(
      String userName,
      String userEmail,
      String userPassword,
      String confirmPassword) async {
    try {

      EasyLoading.show(status: "Please Wait");
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);

      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          userDeviseToken: '',
          isAdmin: false,
          createdOn: DateTime.now());

      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());

      EasyLoading.dismiss();

      return userCredential;

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.shade50,
          colorText: Colors.white);
    }
  }

  Future<UserCredential?> signInMethod(
      String userEmail,
      String userPassword,) async {
    try {
      EasyLoading.show(status: "Please Wait");
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);

      EasyLoading.dismiss();

      return userCredential;

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }
}
