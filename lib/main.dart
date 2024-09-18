import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roombooking/firebase_options.dart';
import 'package:roombooking/view/components/authpage.dart';
import 'package:roombooking/view/components/navibar.dart';
import 'package:roombooking/view/screens/getstart.dart';
import 'package:roombooking/view/screens/home.dart';
import 'package:roombooking/view/screens/home2.dart';
import 'package:roombooking/view/screens/profile.dart';
import 'package:roombooking/view/screens/watchlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 17, 80, 90),
          ),
          useMaterial3: true,
        ),
        home: Authpage());
  }
}
