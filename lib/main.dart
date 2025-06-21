import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/controller/login_screen_controller.dart';
import 'package:main_pjct_homecare/controller/registration_screen_controller.dart';
import 'package:main_pjct_homecare/firebase_options.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/bott_navigation.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/home_screen.dart';
import 'package:main_pjct_homecare/view/login/login_screen.dart';
import 'package:main_pjct_homecare/view/login/registration_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottNavigation(),
      ),
    );
  }
}
