import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/booking_screen_controller.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/booking_screen.dart';

class QuickBookScreen extends StatefulWidget {
  const QuickBookScreen({super.key});

  @override
  State<QuickBookScreen> createState() => _QuickBookScreenState();
}

class _QuickBookScreenState extends State<QuickBookScreen> {
  int? index;
  final formkey = GlobalKey<FormState>();
  TextEditingController todateController = TextEditingController();
  TextEditingController fromdateController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Quick book",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("From Date", style: TextStyle(fontWeight: FontWeight.bold)),

              TextFormField(
                controller: fromdateController,
                readOnly: true,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Select from date'
                            : null,
                onTap: () async {
                  fromdateController
                      .text = await BookingScreenController.selectdate(context);
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Date",
                  //label: Text("Select", style: TextStyle(color: Colors.grey)),
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("To Date", style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: todateController,
                readOnly: true,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Select to date'
                            : null,
                onTap: () async {
                  todateController
                      .text = await BookingScreenController.selectdate(context);
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Date",
                  //label: Text("Select", style: TextStyle(color: Colors.grey)),
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("Services", style: TextStyle(fontWeight: FontWeight.bold)),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  hint: Text("Select Service", style: TextStyle()),
                  value: BookingScreenController.selecteditem,

                  items: List.generate(
                    BookingScreenController.itemlist.length,
                    (index) => DropdownMenuItem(
                      value: BookingScreenController.itemlist[index],
                      child: Text(
                        BookingScreenController.itemlist[index].toUpperCase(),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    BookingScreenController.onselecteditem(value);
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 15),
              Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),

              TextFormField(
                maxLines: 6,
                controller: addresscontroller,
                validator:
                    (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Enter an address'
                            : null,
                decoration: InputDecoration(
                  hintText: "Enter Address",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BookingScreen(
                              fromDate: fromdateController.text,
                              toDate: todateController.text,
                              service: BookingScreenController.selecteditem!,
                              address: addresscontroller.text,
                            ),
                      ),
                    );
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder:
                  //         (context) => BookingScreen(
                  //           fromDate: fromdateController.text,
                  //           toDate: todateController.text,
                  //           service: BookingScreenController.selecteditem!,
                  //           address: addresscontroller.text,
                  //         ),
                  //   ),
                  // );
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
                      "Save Booking",
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
