import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/utils/constants/color_constants.dart';
import 'package:main_pjct_homecare/utils/constants/image_constants.dart';
import 'package:main_pjct_homecare/view/login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,

                  backgroundImage: AssetImage(ImageConstants.profile),
                ),
                ExpansionTile(
                  title: Text(
                    "Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please set your name",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Full Name",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Bio",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please set a short description about you",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "short note about yourself",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "email id",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please set your email adress",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "email address",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "mobile number",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please set your mobile number",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "phone number",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "bank account",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please set your bank details",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "acc number",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "IFSC Code",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Address",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please update your address",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Full address",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "postal code",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Aadhar number",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Please set your Aadhar number",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Aadhar id number",
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          "Sign out",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Delete account",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
