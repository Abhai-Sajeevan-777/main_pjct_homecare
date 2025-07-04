import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/category_booking_screen_controller.dart';
import 'package:main_pjct_homecare/view/home_screen/inner_screens/category_nurse_booking_screen.dart';
import 'package:provider/provider.dart';

class BookingDetailsScreen extends StatelessWidget {
  final int categoryindex;
  final String name;
  const BookingDetailsScreen({
    super.key,
    required this.categoryindex,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final screenprovider = context.read<CategoryBookingScreenController>();
    final List<Nurse> nurses = screenprovider.getnurses(categoryindex);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Booking for $name",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: nurses.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            CategoryNurseBookingScreen(nurse: nurses[index]),
                  ),
                );
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(nurses[index].image),
              ),
              title: Text(nurses[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(screenprovider.allNurses[index].description),
                  SizedBox(height: 5),
                  Text(
                    '⭐ ${screenprovider.allNurses[index].rating}   ₹${screenprovider.allNurses[index].price}/day',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
