import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mangemant/screen/auth_screen/signup_screen.dart';
import 'package:task_mangemant/screen/home_screen.dart';
import '../../admin_panel/Admin_panel.dart';
import '../../controller/get_user_data.dart';
import '../../controller/signup_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GetUserDataController _getUserDataController = Get.put(GetUserDataController());
  final SignUpController _signUpController = Get.put(SignUpController());

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
                  const SizedBox(height: 100,),
                  const Text('Login To Task Manager ', style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,

                  ),),
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
                        controller: userPassword,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          String email = userEmail.text.trim();
                          String password = userPassword.text.trim();

                          if(email.isEmpty || password.isEmpty){
                            Get.snackbar("Error", "Please Enter All Details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                colorText: Colors.white);
                          } else{
                            UserCredential? userCredential =
                                await _signUpController.signInMethod(
                                email,
                                password);

                            var userData = await _getUserDataController.getUserData(userCredential!.user!.uid);

                            if(userCredential != null){
                              if(userCredential.user!.emailVerified){
                                if(userData[0]['isAdmin'] == true){

                                  Get.offAll(() => const AdminMainScreen());
                                  Get.snackbar(
                                      "Success Admin login",
                                      "Login Successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.blue,
                                      colorText: Colors.white);
                                } else{
                                  Get.offAll(() => const HomeScreen());
                                  Get.snackbar(
                                      "Success User Login",
                                      "Login Successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.blue,
                                      colorText: Colors.white);
                                }
                              } else{

                                Get.snackbar(
                                    "Error",
                                    "Please Verify Your Email Before Login",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.blue,
                                    colorText: Colors.white);
                              }
                            } else{

                              Get.snackbar(
                                  "Error",
                                  "Please Try Again",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.blue,
                                  colorText: Colors.white);
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
                              Text('Sign In',style: TextStyle(
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
                          Get.to(() => const SignUpScreen());
                        },
                        child: const Text('Sign Up',style: TextStyle(
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
