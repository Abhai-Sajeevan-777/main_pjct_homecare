import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatelessWidget {
  final String fromDate;
  final String toDate;
  final String service;
  final String address;
  const BookingScreen({
    super.key,
    required this.fromDate,
    required this.toDate,
    required this.service,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking list",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection('bookings')
                .orderBy('createdAt', descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Center(child: const CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text("No booking yet"));
          }
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final booking = docs[index].data();
              final fromDate = (booking['fromdate'] as Timestamp?)?.toDate();
              final toDate = (booking['toDate'] as Timestamp?)?.toDate();
              final dateFormat = DateFormat('dd MMM yyyy');
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    booking['name'] ?? 'unknown',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (booking['phone'] != null)
                        Text("Phone       : ${booking['phone']}"),
                      if (booking['service'] != null)
                        Text("service :${booking['service']}"),
                      if (fromDate != null)
                        Text("From :${dateFormat.format(fromDate)}"),
                      if (toDate != null) Text("To :${booking['toDate']}"),
                      if (booking['address'] != null)
                        Text("Address :${booking['address']}"),
                      if (booking['totalDays'] != null)
                        Text("Total Days :${booking['totalDays']}"),
                      if (booking['totalPrice'] != null)
                        Text("Price :${booking['totalprice']}"),
                      if (booking['paymentId'] != null)
                        Text("Payment ID :${booking['paymentId']}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
