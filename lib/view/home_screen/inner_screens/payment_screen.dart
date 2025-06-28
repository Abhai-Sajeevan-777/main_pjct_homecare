import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String fromdate;
  final String todate;
  final String service;
  final String address;
  final int totalDays;
  final double totalPrice;
  const PaymentScreen({
    super.key,
    required this.fromdate,
    required this.todate,
    required this.service,
    required this.address,
    required this.totalDays,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
