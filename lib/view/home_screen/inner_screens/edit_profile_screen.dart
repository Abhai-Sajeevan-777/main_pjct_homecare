import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_pjct_homecare/controller/edit_profile_controller.dart';
import 'package:main_pjct_homecare/utils/constants/color_constants.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/profile_screen.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroler = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  @override
  void initState() {
    final preload = context.read<EditProfileController>();
    namecontroller = TextEditingController(text: preload.name);
    emailcontroller = TextEditingController(text: preload.email);
    phonecontroler = TextEditingController(text: preload.phone);
    addresscontroller = TextEditingController(text: preload.address);
    agecontroller = TextEditingController(text: preload.age);
    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    phonecontroler.dispose();
    addresscontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenproviders = context.watch<EditProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: ColorConstants.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: namecontroller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: emailcontroller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: phonecontroler,
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return "Number required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Phone",
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: addresscontroller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Address is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter addresss",
                  prefixIcon: Icon(Icons.home),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select a gender";
                  }
                  return null;
                },
                value: screenproviders.selectedgender,
                decoration: InputDecoration(
                  hint: Text("Gender"),
                  prefixIcon: Icon(Icons.male),
                  border: OutlineInputBorder(),
                ),
                items: List.generate(
                  screenproviders.genderlist.length,
                  (index) => DropdownMenuItem(
                    value: screenproviders.genderlist[index],
                    child: Text(screenproviders.genderlist[index]),
                  ),
                ),
                onChanged: (value) {
                  screenproviders.setgender(value);
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: agecontroller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Age is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Age",
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    await screenproviders.saveprofile(
                      name: namecontroller.text,
                      email: emailcontroller.text,
                      phone: phonecontroler.text,
                      address: addresscontroller.text,
                      gender: screenproviders.selectedgender ?? "",
                      age: agecontroller.text,
                    );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Profile updated")));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
