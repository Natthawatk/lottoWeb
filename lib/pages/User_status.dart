import 'package:flutter/material.dart';

// ignore: camel_case_types
class User_status extends StatelessWidget {
  const User_status({super.key});

  @override
  Widget build(BuildContext context) {
    String logo = 'assets/images/logo.jpg';
    String userImg = 'assets/images/user.jpg';

    return Scaffold(
    appBar: AppBar(
        title: Image.asset(
          logo,
          height: 100,
          width: 100,
        ),
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'admin',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 80, 42, 206),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          userImg,
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Text(
                          'User Lotory 1',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 8), // Space between icon and text
                            Text(
                              'user@gmail.com',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              '012-345-6789',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}