import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        title: Text("Booking list"),
        backgroundColor: Colors.green,
      ),
      body:
      // Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // Text("From Date : $fromDate"),
      //       // Text("To Date : $toDate"),
      //       // Text("Service : $service"),
      //       // Text("Address : $address"),
      //       Container(
      //         height: 130,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(12),
      //           color: Colors.blueGrey,
      //         ),
      //         child: Column(children: []),
      //       ),
      //     ],
      //   ),
      // ),
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('nursing').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(snapshot.data!.docs[index]['name']));
            },
          );
        },
      ),
    );
  }
}
