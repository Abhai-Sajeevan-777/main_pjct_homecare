import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/model/nurse_model.dart';
import 'package:main_pjct_homecare/utils/constants/image_constants.dart';

class Nurse {
  final String name;
  final String description;
  final String image;
  final double price;
  final List<String> slots;
  final int serviceIndex;
  final double rating;

  Nurse(
    this.name,
    this.description,
    this.image,
    this.price,
    this.slots,
    this.serviceIndex,
    this.rating,
  );
}

class CategoryBookingScreenController with ChangeNotifier {
  final List<Nurse> allNurses = [
    Nurse(
      'Anjali',
      'Post-op & elderly care',
      ImageConstants.nurse1,
      500,
      ['9–10 AM'],
      0,
      4.8,
    ),
    Nurse(
      'Kavya',
      'Wound care expert',
      ImageConstants.nurse2,
      520,
      ['10–11 AM'],
      0,
      4.7,
    ),
    Nurse(
      'Megha',
      'Home ICU support',
      ImageConstants.nurse3,
      540,
      ['1–2 PM'],
      0,
      4.6,
    ),
    Nurse(
      'Seema',
      'Vitals & injections',
      ImageConstants.nurse4,
      530,
      ['3–4 PM'],
      0,
      4.9,
    ),
    Nurse(
      'Priya',
      'Infant wellness expert',
      ImageConstants.nurse5,
      600,
      ['10–11 AM'],
      1,
      4.6,
    ),
    Nurse(
      'Nisha',
      'Sleep & feed routines',
      ImageConstants.nurse6,
      610,
      ['1–2 PM'],
      1,
      4.8,
    ),
    Nurse(
      'Varsha',
      'Toddler care',
      ImageConstants.nurse7,
      590,
      ['9–10 AM'],
      1,
      4.7,
    ),
    Nurse(
      'Lavanya',
      'Play & safety focus',
      ImageConstants.nursr8,
      605,
      ['3–4 PM'],
      1,
      4.5,
    ),
    Nurse(
      'Radha',
      'Geriatric mobility care',
      ImageConstants.nurse9,
      450,
      ['8–9 AM'],
      2,
      4.9,
    ),
    Nurse(
      'Sushma',
      'Dementia-friendly care',
      ImageConstants.nurse1,
      470,
      ['10–11 AM'],
      2,
      4.6,
    ),
    Nurse(
      'Reena',
      'Medication management',
      ImageConstants.nurse2,
      460,
      ['1–2 PM'],
      2,
      4.7,
    ),
    Nurse(
      'Manju',
      'Daytime companionship',
      ImageConstants.nurse3,
      440,
      ['3–4 PM'],
      2,
      4.8,
    ),
    Nurse(
      'Divya',
      'Postpartum recovery coach',
      ImageConstants.nurse4,
      550,
      ['11–12 PM'],
      3,
      4.7,
    ),
    Nurse(
      'Ritika',
      'Breastfeeding guidance',
      ImageConstants.nurse5,
      560,
      ['9–10 AM'],
      3,
      4.8,
    ),
    Nurse(
      'Sneha',
      'Massage & nutrition',
      ImageConstants.nurse6,
      580,
      ['2–3 PM'],
      3,
      4.6,
    ),
    Nurse(
      'Aarti',
      'Emotional wellness care',
      ImageConstants.nurse7,
      540,
      ['3–4 PM'],
      3,
      4.9,
    ),
    Nurse(
      'Rekha',
      'Bathing assistance',
      ImageConstants.nursr8,
      400,
      ['1–2 PM'],
      4,
      4.5,
    ),
    Nurse(
      'Poonam',
      'Feeding & hygiene',
      ImageConstants.nurse9,
      390,
      ['10–11 AM'],
      4,
      4.6,
    ),
    Nurse(
      'Sheetal',
      'Medication reminders',
      ImageConstants.nurse1,
      420,
      ['2–3 PM'],
      4,
      4.7,
    ),
    Nurse(
      'Komal',
      'Home help & companionship',
      ImageConstants.nurse2,
      410,
      ['9–10 AM'],
      4,
      4.8,
    ),
  ];

  List<Nurse> getnurses(int index) {
    return allNurses.where((element) => element.serviceIndex == index).toList();
  }
}
