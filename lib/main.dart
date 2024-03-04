import 'package:artisian_harbour/Presentation/Screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:artisian_harbour/Constants/Colours.dart';
import 'package:artisian_harbour/Presentation/Screens/Login.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artisian Harbour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colours.blue),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Set initial route
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()), // Define the login route
        GetPage(name: '/home', page: () => Homescreen()), // Define the home route
        // Add more routes for other screens
      ],
    );
  }
}
