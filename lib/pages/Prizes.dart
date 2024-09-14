import 'dart:math';
import 'package:flutter/material.dart';
import 'dashboard.dart'; // ตรวจสอบให้แน่ใจว่าคุณนำเข้าหน้าต่าง AdminDashboard ถูกต้อง

class Prizes extends StatefulWidget {
  const Prizes({super.key});

  @override
  _PrizesState createState() => _PrizesState();
}

class _PrizesState extends State<Prizes> {
  // ตัวแปรสำหรับเก็บผลลัพธ์ของการสุ่ม
  List<String> prizeNumbers = ["000000", "000000", "000000", "000000", "000000"];

  // ฟังก์ชันสุ่มตัวเลข 6 หลัก
  String generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000; // สุ่มตัวเลข 6 หลัก
    return randomNumber.toString();
  }

  // ฟังก์ชันสำหรับสุ่มรางวัล
  void randomizePrizes() {
    setState(() {
      prizeNumbers = List.generate(5, (_) => generateRandomNumber());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.jpg',
          height: 50,
        ),
        backgroundColor: Colors.white,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.02),

                // ปุ่มสุ่มรางวัล
                GestureDetector(
                  onTap: randomizePrizes, // เมื่อคลิกจะเรียกฟังก์ชันสุ่มรางวัล
                  child: buildLotteryButton(size),
                ),
                SizedBox(height: size.height * 0.02),

                // ข้อความ 'ลำดับรางวัลที่ออก'
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ลำดับรางวัลที่ออก',
                    style: TextStyle(fontSize: size.height * 0.02),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // ส่วนแสดงผลรางวัล
                buildPrizeSection(size),
                SizedBox(height: size.height * 0.03),

                // ปุ่มยืนยันการออกรางวัล
                buildConfirmButton(size),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildBottomButtons(size),
          ),
        ],
      ),
    );
  }

  Widget buildLotteryButton(Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'สุ่มรางวัล',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.shuffle,
            color: Colors.white,
            size: size.height * 0.05,
          ),
        ],
      ),
    );
  }

  Widget buildPrizeSection(Size size) {
    return Container(
      padding: EdgeInsets.all(size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.yellow.shade600,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // แถวแสดงรางวัลที่ 1
          Text(
            '1st',
            style: TextStyle(
              fontSize: size.height * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: prizeNumbers[0]
                .split('')
                .map((digit) => buildPrizeNumber(digit, size, Colors.yellow.shade400))
                .toList(),
          ),
          SizedBox(height: size.height * 0.025),

          // รางวัลอันดับที่ 2 ถึง 5
          buildPrizeRows(size),
        ],
      ),
    );
  }

  Widget buildPrizeNumber(String number, Size size, Color color) {
    return Container(
      padding: EdgeInsets.all(size.height * 0.02),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1.0), // Border for better visibility
      ),
      child: Text(
        number,
        style: TextStyle(
          fontSize: size.height * 0.03,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPrizeRows(Size size) {
    return Column(
      children: [
        buildPrizeRow(prizeNumbers[1], prizeNumbers[2], '2nd', '3rd', size),
        SizedBox(height: size.height * 0.03),
        buildPrizeRow(prizeNumbers[3], prizeNumbers[4], '4th', '5th', size),
      ],
    );
  }

  Widget buildPrizeRow(String num1, String num2, String label1, String label2, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildPrizeLabelAndNumber(label1, num1, size),
        buildPrizeLabelAndNumber(label2, num2, size),
      ],
    );
  }

  Widget buildPrizeLabelAndNumber(String label, String number, Size size) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 1.0), // Border for better visibility
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: size.width * 0.02),
            buildPrizeNumber(number, size, Colors.orange.shade200),
          ],
        ),
      ),
    );
  }

  Widget buildConfirmButton(Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'ยืนยันการออกรางวัล',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildBottomButtons(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildBottomButton(Icons.home),
          buildBottomButton(Icons.shuffle),
          buildBottomButton(Icons.refresh),
        ],
      ),
    );
  }

  Widget buildBottomButton(IconData icon) {
    return IconButton(
      icon: Icon(icon, size: 30, color: Colors.blue),
      onPressed: () {
        // เพิ่มฟังก์ชันนำทางระหว่างหน้า
        if (icon == Icons.home) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminDashboard()),
          );
        } // ไม่มีการนำทางเมื่อ icon เป็น Icons.person
      },
    );
  }
}
