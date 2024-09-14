import 'package:flutter/material.dart';

// ignore: camel_case_types
class User_status extends StatelessWidget {
  const User_status({super.key, required String status});

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
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
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the start
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns all children to the left
              children: [
                const Text(
                  'รายการที่ถูกรางวัล',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10), // Add some spacing
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 220, 42),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity, // Make it stretch horizontally
                  alignment: Alignment.centerLeft, // Center the content
                  child: const Text(
                    '109212', // Replace this with dynamic content if needed
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), // Text color fo r better visibility
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add more spacing between the two columns
                const Text(
                  'รายการที่ไม่ถูกรางวัล',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10), // Add some spacing
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 17, 17), // Different color for the second section
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity, // Make it stretch horizontally
                  alignment: Alignment.centerLeft, // Center the content
                  child: const Text(
                    '108109', // Customize or replace this text
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), // Text color for better visibility
                    ),
                  ),
                ),
                const SizedBox(height: 60), //
                Padding(
                  padding: const EdgeInsets.only(
                    left: 80.0),
                  child: ElevatedButton(
                  onPressed: () {
                    // เขียนโค้ดสำหรับการทำงานเมื่อปุ่มถูกกด
                    print('ชำระเงิน');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 29, 220, 42),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // ขนาดของปุ่ม
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // มุมโค้งของปุ่ม
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'ยืนยันการจ่ายเงิน',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), // สีข้อความ
                    ),
                  ),
                                ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}