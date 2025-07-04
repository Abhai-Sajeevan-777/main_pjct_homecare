import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/booking_nurse_controller.dart';
import 'package:main_pjct_homecare/controller/category_booking_screen_controller.dart';
import 'package:provider/provider.dart';

class CategoryNurseBookingScreen extends StatefulWidget {
  final Nurse nurse;
  const CategoryNurseBookingScreen({super.key, required this.nurse});

  @override
  State<CategoryNurseBookingScreen> createState() =>
      _CategoryNurseBookingScreenState();
}

class _CategoryNurseBookingScreenState
    extends State<CategoryNurseBookingScreen> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    phcontroller.dispose();
    addresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sprovider = context.watch<BookingNurseController>();
    sprovider.setNurse(widget.nurse);
    return Scaffold(
      appBar: AppBar(title: Text('Book ${widget.nurse.name}')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),

                TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Full Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Full Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                TextFormField(
                  controller: phcontroller,
                  validator: (value) {
                    if (value != null && value.length != 10) {
                      return null;
                    } else {
                      return "Please enter your 10 dight phone number";
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Phone Number"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),

                TextFormField(
                  controller: addresscontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Address"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                Text("Days", style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        sprovider.decrementDays();
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      "${sprovider.selectDays}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        sprovider.incrementDays();
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Text(
                  "Total : ₹${sprovider.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 25),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Save Booking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
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
