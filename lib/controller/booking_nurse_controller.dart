import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/category_booking_screen_controller.dart';

class BookingNurseController with ChangeNotifier {
  late Nurse nurse;

  void setNurse(Nurse nurseData) {
    nurse = nurseData;
    notifyListeners();
  }

  int selectDays = 1;

  void incrementDays() {
    if (selectDays < 30) {
      selectDays++;
      notifyListeners();
    }
  }

  void decrementDays() {
    if (selectDays > 1) {
      selectDays--;
      notifyListeners();
    }
  }

  double get totalPrice => nurse.price * selectDays;
}
