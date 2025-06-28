import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  final int index;
  final String name;
  const BookingDetailsScreen({
    super.key,
    required this.index,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Booking for $name",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(child: Text("data")),
    );
  }
}
