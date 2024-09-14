import 'package:flutter/material.dart';
import 'dashboard.dart'; // ตรวจสอบให้แน่ใจว่าคุณนำเข้าหน้านี้ถูกต้อง
import 'user_info.dart'; // ตรวจสอบให้แน่ใจว่าคุณนำเข้าหน้านี้ถูกต้อง


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.jpg', // โลโก้
          height: 50,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'admin',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('รายการที่ขาย', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Column(
              children: [
                buildSoldItem('109801', 'User Lottery', Colors.red),
                buildSoldItem('215081', 'User Lottery', Colors.red),
                buildSoldItem('952467', 'User Lottery', Colors.red),
              ],
            ),
            const SizedBox(height: 20),
            const Text('รายการคงเหลือ', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildAvailableItem('538973'),
                  buildAvailableItem('053146'),
                  buildAvailableItem('981279'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildBottomButton(Icons.home),
          buildBottomButton(Icons.casino), // เปลี่ยนเป็น icon สุ่มรางวัล
          buildBottomButton(Icons.refresh),
          buildBottomButton(Icons.person),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              // กลับไปหน้า AdminDashboard
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboard()),
              );
              break;
            case 1:
              // ไปหน้า Prizes ที่มีอยู่แล้ว
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Prizes()),
              );
              break;
            case 2:
              // รีเฟรชหน้า (รีเซ็ตระบบ)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboard()),
              );
              break;
            case 3:
              // ไปหน้า User_info
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const User_info()),
              );
              break;
          }
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomButton(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 30, color: Colors.blueAccent),
      label: '', // ไม่ต้องแสดงข้อความ
    );
  }

  Widget buildSoldItem(String number, String title, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvailableItem(String number) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

// หน้าจอ Prizes ที่มีอยู่แล้ว
class Prizes extends StatelessWidget {
  const Prizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prizes'),
      ),
      body: const Center(
        child: Text('หน้าจอแสดงรางวัล'),
      ),
    );
  }
}

// หน้าจอ User_info
class User_info extends StatelessWidget {
  const User_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: const Center(
        child: Text('หน้าจอข้อมูลผู้ใช้'),
      ),
    );
  }
}
