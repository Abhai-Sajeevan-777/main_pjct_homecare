import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreenController {
  static String? selecteditem;
  static List<String> itemlist = [
    "Nursing Service",
    "Baby Sitter",
    "Geriatic Care",
    "Pre and Post Natal Care",
    "Caregiver Service",
  ];

  static Future<String> selectdate(BuildContext context) async {
    var selectedate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (selectedate != null) {
      String formatdate = DateFormat("dd/MM/yyyy").format(selectedate);
      return formatdate;
    }
    return "";
  }

  static void onselecteditem(String? value) {
    selecteditem = value;
  }
}
