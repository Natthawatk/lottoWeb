import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lotto_application_1/user_pages/lottery_page.dart';
import 'package:lotto_application_1/pages/admin.dart';

class LoginPage extends StatefulWidget {
  final String? username;
  final String? password;

  const LoginPage({super.key, this.username, this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
    _passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // จำลองการดึงข้อมูล JSON จาก API
    // คุณสามารถแทนที่โค้ดนี้ด้วยการเรียก API จริงได้
    final response = '''
    {
      "username": "${_usernameController.text}",
      "position": "admin",
      "user_id": "12345"
    }
    ''';

    // แปลง JSON เป็น Map
    final jsonResponse = jsonDecode(response);

    // ดึงค่า position และตรวจสอบ
    final position = jsonResponse['position'];
    final userId = jsonResponse['user_id'];

    if (position == 'admin') {
      // นำทางไปยัง AdminScreen พร้อม user_id
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Admin(),
        ),
      );
    } else {
      // นำทางไปยัง LotteryScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LotteryScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String logo = 'assets/images/logo.jpg';

    return Scaffold(
      body: Stack(
        children: [
          // วงกลมสีฟ้าสองวงในพื้นหลัง
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -150,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // กรอบรูปอยู่ข้างบน
                    Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ตัวอักษร Login ที่ใช้ฟอนต์ตามที่ต้องการ
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'CustomFont', // ฟอนต์ที่ใช้
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ตัวอักษร Username และช่องใส่ Username
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, // สีดำ
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Username',
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // ตัวอักษร Password และช่องใส่ Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, // สีดำ
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    // ปุ่ม Login
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ลิงก์ Don't have an account yet? Register here
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                '/register'); // นำทางไปยังหน้า RegisterPage
                          },
                          child: const Text(
                              "Don't have an account yet? Register here"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
