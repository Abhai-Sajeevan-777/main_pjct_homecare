import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/booking_screen_controller.dart';

import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class QuickBookScreen extends StatefulWidget {
  const QuickBookScreen({super.key});

  @override
  State<QuickBookScreen> createState() => _QuickBookScreenState();
}

class _QuickBookScreenState extends State<QuickBookScreen> {
  //int? index;
  final formkey = GlobalKey<FormState>();
  late final TextEditingController namecontroller = TextEditingController();
  late final TextEditingController phonecontroller = TextEditingController();
  late final TextEditingController todateController = TextEditingController();
  late final TextEditingController fromdateController = TextEditingController();
  late final TextEditingController addresscontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    phonecontroller.dispose();
    fromdateController.dispose();
    todateController.dispose();
    addresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenstate = context.watch<BookingScreenController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Quick book",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              namecontroller.clear();
              phonecontroller.clear();
              fromdateController.clear();
              todateController.clear();
              addresscontroller.clear();
              screenstate.reset();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Full Name",

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
                SizedBox(height: 15),

                Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: phonecontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your phone number';
                    }
                    if (value.length != 10) {
                      return 'Enter your 10 dight phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "10 digit number",

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
                SizedBox(height: 15),

                Text(
                  "From Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                TextFormField(
                  controller: fromdateController,
                  readOnly: true,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Select from date'
                              : null,
                  onTap: () async {
                    fromdateController.text = await screenstate.selectfromdate(
                      context,
                    );
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
                    todateController.text = await screenstate.selecttodate(
                      context,
                    );
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

                DropdownButtonFormField(
                  value: screenstate.selecteditem,
                  validator: (value) {
                    if (value == null) {
                      return "Please select a service";
                    }
                    return null;
                  },
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: "Select Service",
                    border: OutlineInputBorder(
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
                  items: List.generate(
                    screenstate.itemlist.length,
                    (index) => DropdownMenuItem(
                      value: screenstate.itemlist[index],
                      child: Text(screenstate.itemlist[index].toUpperCase()),
                    ),
                  ),
                  onChanged: (value) {
                    screenstate.onselecteditem(value);
                  },
                ),

                SizedBox(height: 15),
                Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),

                TextFormField(
                  maxLines: 3,
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Days :",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${screenstate.numberOfDays}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price :",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₹${screenstate.totalPrice}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      if (screenstate.selecteditem == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please select a service")),
                        );
                        return;
                      }
                      Razorpay razorpay = Razorpay();
                      var options = {
                        'key': 'rzp_test_1DP5mmOlF5G5ag',
                        'amount': (screenstate.totalPrice * 100).round(),
                        'name': 'Home Care',
                        'description': 'Quick Booking',
                        'send_sms_hash': true,
                        'prefill': {
                          'contact': '8888888888',
                          'email': 'test@razorpay.com',
                        },
                        'external': {
                          'wallets': ['paytm'],
                        },
                      };
                      razorpay.on(
                        Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse,
                      );
                      razorpay.on(
                        Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse,
                      );
                      razorpay.on(
                        Razorpay.EVENT_EXTERNAL_WALLET,
                        handleExternalWalletSelected,
                      );
                      razorpay.open(options);
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
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(
      context,
      "Payment Failed",
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}",
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */

    //--------------------------------

    // showAlertDialog(
    //   context,
    //   "Payment Successful",
    //   "Payment ID: ${response.paymentId}",
    // );

    // showAlertDialog(context, "Error", "Failed to save booking :$e");

    final screenprovider = context.read<BookingScreenController>();

    screenprovider
        .saveBooking(
          name: namecontroller.text.trim(),
          phone: phonecontroller.text.trim(),
          address: addresscontroller.text.trim(),
          paymentId: response.paymentId ?? '',
        )
        .then((value) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Booking saved successfully")));
          screenprovider.reset();
          namecontroller.clear();
          phonecontroller.clear();
          addresscontroller.clear();
          todateController.clear();
          fromdateController.clear();
        })
        .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error Saving booking : $error")),
          );
        });
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
      context,
      "External Wallet Selected",
      "${response.walletName}",
    );
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(title: Text(title), content: Text(message));
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
