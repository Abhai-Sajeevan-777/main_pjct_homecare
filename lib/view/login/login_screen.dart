import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/login_screen_controller.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/bott_navigation.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/home_screen.dart';
import 'package:main_pjct_homecare/view/login/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final RegExp _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              // spacing: 15,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //color: Colors.white,
                  ),
                ),
                //SizedBox(height: 20),
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
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                    );
                    return emailRegex.hasMatch(value)
                        ? null
                        : "Enter a valid email address";

                    //return null;
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
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return "minimum 8 numbers required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      context.read<LoginScreenController>().onLogin(
                        emailAddress: emailcontroller.text,
                        password: passwordcontroller.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottNavigation(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                          "New user?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
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
