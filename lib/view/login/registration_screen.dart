import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/registration_screen_controller.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/home_screen.dart';
import 'package:main_pjct_homecare/view/login/login_screen.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              //spacing: 8,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text("Please enter your details"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "email",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (emailcontroller.text.contains("@gmail.com")) {
                      return null;
                    } else {
                      return "Enter a valid email";
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (passwordcontroller.text.length >= 8) {
                      return null;
                    } else {
                      return "Enter minimum 8 numbers";
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "confirm password",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                TextFormField(
                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (confirmpasswordcontroller.text ==
                        passwordcontroller.text) {
                      return null;
                    } else {
                      return "Password doesn't match";
                    }
                  },
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      context.read<RegistrationScreenController>().onregister(
                        emailAddress: emailcontroller.text,
                        password: passwordcontroller.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Center(
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
