import 'package:flutter/material.dart';
import 'package:lotto_application_1/pages/User_info.dart';
import 'package:lotto_application_1/pages/User_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Lotto Web',
       routes: {
        '/user-status': (context) => const User_status(),
      },
      home: const User_info(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

