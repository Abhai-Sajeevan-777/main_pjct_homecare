import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/utils/constants/color_constants.dart';
import 'package:main_pjct_homecare/utils/constants/image_constants.dart';

import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/notification_screen.dart';

import 'package:main_pjct_homecare/view/home_screen/inner_screens/booking_details_screen.dart';
import 'package:main_pjct_homecare/view/home_screen/inner_screens/quick_book_screen.dart';
import 'package:main_pjct_homecare/view/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> names = [
    'Nursing Service',
    'Baby Sitter',
    'Geriatic Care',
    'Pre and Post Natal Care',
    'Caregiver Service',
  ];
  List<String> images = [
    "assets/images/Baby sitter.jpg",
    "assets/images/caregivers.jpg",
    "assets/images/geriatic care.jpg",
    "assets/images/Nursing service.jpg",
    "assets/images/pre and post natal care.jpg",
  ];

  static List<Map<String, String>> services = [
    {
      "images": "assets/images/Nursing service.jpg",
      "name": "Nursing \n Service",
    },
    {"images": "assets/images/Baby sitter.jpg", "name": "Baby \nSitter"},
    {"images": "assets/images/geriatic care.jpg", "name": "Geriatric \n Care"},
    {
      "images": "assets/images/pre and post natal care.jpg",
      "name": "Pre and Post\n Natal Care",
    },
    {"images": "assets/images/caregivers.jpg", "name": "Caregiver \n Service"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.green,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(ImageConstants.profile),
        ),
        title: Text(
          "Home Care",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            icon: Icon(Icons.notifications_active),
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure to logout"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text("Logout"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                      ],
                    ),
              );
            },
            icon: Icon(Icons.logout),
          ),
          SizedBox(width: 15),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder:
                    (context, index, realIndex) => Container(
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[index]),
                        ),
                      ),
                    ),
                options: CarouselOptions(
                  height: 180,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuickBookScreen()),
                  );
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Quick Book \n Let us find expert partner for you !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(services.length, (index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BookingDetailsScreen(
                                      index: index,
                                      name: names[index],
                                    ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 35,

                            backgroundImage: AssetImage(
                              services[index]['images']!,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          services[index]['name']!,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Top Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    services.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 125,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
