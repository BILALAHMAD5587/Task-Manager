import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mangemant/screen/auth_screen/login_screen.dart';

import '../../controller/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = Get.put(SignUpController());

  TextEditingController usernName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue.shade50,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade50,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Create Account', style: TextStyle(
                    fontSize: 21,
                      fontWeight: FontWeight.bold,
            
                  ),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: usernName,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            prefixIcon: Icon(Icons.email_outlined, size: 20,color:Colors.black.withOpacity(0.40),),
                            hintText: "Enter Name",
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.40),
                                fontSize: 14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: userEmail,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            prefixIcon: Icon(Icons.email_outlined, size: 20,color:Colors.black.withOpacity(0.40),),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.40),
                                fontSize: 14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            prefixIcon: Icon(Icons.lock_outline, size: 20,color:Colors.black.withOpacity(0.40),),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.40),
                                fontSize: 14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: confirmPassword,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.10))),
                            prefixIcon: Icon(Icons.lock_outline, size: 20,color:Colors.black.withOpacity(0.40),),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.40),
                                fontSize: 14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          String name = usernName.text.trim();
                          String email = userEmail.text.trim();
                          String userConfirmPassword = confirmPassword.text.trim();
                          String userPassword = password.text.trim();

                          if(
                          name.isEmpty ||
                              email.isEmpty ||
                              userPassword.isEmpty ||
                              userConfirmPassword.isEmpty
                          ){
                            Get.snackbar(
                                "Error",
                                "Please Enter All Details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                colorText: Colors.white);
                          } else{

                            UserCredential? userCredential = await _signUpController
                                .signUpMethod(
                                name,
                                email,
                                userPassword,
                                '');
                            if(userCredential != null){
                              Get.snackbar(
                                  "Verification Email Send..",
                                  "Please Check Your Email",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.blue,
                                  colorText: Colors.white);

                              FirebaseAuth.instance.signOut();
                              Get.offAll(() => const SignInScreen());
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width:  130,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(21),
                              border: Border.all(color: Colors.blue)
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sign Up ',style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 19,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 280,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have a Account?',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13
                      ),),
                      const SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Get.to(() => const SignInScreen());
                        },
                        child: const Text('Sign In',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          color: Colors.blue
                        ),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
    ));
  }
}
