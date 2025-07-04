import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController with ChangeNotifier {
  String? selectedgender;
  List<String> genderlist = ["Male", "Female", "Others"];
  final ImagePicker picker = ImagePicker();
  XFile? pickedimage;

  String name = '';
  String email = '';
  String phone = '';
  String address = '';
  String gender = '';
  String age = '';

  void setgender(String? gender) {
    selectedgender = gender;
    notifyListeners();
  }

  Future<void> pickimage() async {
    final img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      pickedimage = img;
      notifyListeners();
    }
  }

  Future<void> saveprofile({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String gender,
    required String age,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name.trim(),
      'email': email.trim(),
      'phone': phone.trim(),
      'address': address.trim(),
      'gender': gender,
      'age': age.trim(),
    }, SetOptions(merge: true));
  }
}
