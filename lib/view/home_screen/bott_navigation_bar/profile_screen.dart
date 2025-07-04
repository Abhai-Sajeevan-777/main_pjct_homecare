import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/utils/constants/color_constants.dart';
import 'package:main_pjct_homecare/view/home_screen/inner_screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String? gender;
  final String age;
  const ProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.green,
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("email"),
                        Text("phone"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Divider(height: 12),
                ListTile(title: Text("Address"), subtitle: Text("address")),
                ListTile(title: Text("Gender"), subtitle: Text("gender")),
                ListTile(title: Text("Age"), subtitle: Text("age")),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "Sign out",
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
    );
  }
}
