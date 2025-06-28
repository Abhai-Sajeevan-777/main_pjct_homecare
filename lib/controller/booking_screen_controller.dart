import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreenController with ChangeNotifier {
  DateTime? fromdate;
  DateTime? todate;
  double priceperday = 700.0;
  String? selecteditem;
  List<String> itemlist = [
    "Nursing Service",
    "Baby Sitter",
    "Geriatic Care",
    "Pre and Post Natal Care",
    "Caregiver Service",
  ];
  // final Map<String, double> itemlist = {
  //   "Nursing Service": 700,
  //   "Baby Sitter": 600,
  //   "Geriatic Care": 650,
  //   "Pre and Post Natal Care": 750,
  //   "Caregiver Service": 680,
  // };

  Future<String> selectfromdate(BuildContext context) async {
    var selectedate = await showDatePicker(
      context: context,
      initialDate: fromdate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (selectedate != null) {
      fromdate = selectedate;
      notifyListeners();
      String formatdate = DateFormat("dd/MM/yyyy").format(selectedate);
      return formatdate;
    }
    return "";
  }

  Future<String> selecttodate(BuildContext context) async {
    var selectdate = await showDatePicker(
      context: context,
      initialDate: todate ?? fromdate?.add(Duration(days: 1)) ?? DateTime.now(),
      firstDate: fromdate ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
    );

    if (selectdate != null) {
      todate = selectdate;
      notifyListeners();
      String formateddate = DateFormat("dd/MM/yyyy").format(selectdate);
      return formateddate;
    }
    return "";
  }

  int get numberOfDays {
    if (fromdate != null && todate != null) {
      final diff = todate!.difference(fromdate!).inDays;
      return diff >= 0 ? diff + 1 : 0;
    }
    return 0;
  }

  double get totalPrice {
    return numberOfDays * priceperday;
  }

  void reset() {
    fromdate = null;
    todate = null;
    selecteditem = null;
    notifyListeners();
  }

  void onselecteditem(String? value) {
    selecteditem = value;
    //priceperday = itemlist[value] ?? 700;
    notifyListeners();
  }
}
