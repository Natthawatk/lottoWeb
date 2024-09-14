import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lotto_application_1/user_pages/lotterty_detial.dart'; // ตรวจสอบชื่อไฟล์และที่อยู่ให้ตรง
import 'package:lotto_application_1/user_pages/profile_page.dart';
import 'package:lotto_application_1/user_pages/purchase_page.dart';

class LotteryScreen extends StatefulWidget {
  const LotteryScreen({super.key});

  @override
  _LotteryScreenState createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  String lotteryNumber = '';
  List<String> allLotteryNumbers = [];
  List<String> displayedNumbers = [];
  double balance = 700.00;
  TextEditingController searchController = TextEditingController();
  String logo = 'assets/images/logo.jpg';

  @override
  void initState() {
    super.initState();
    generateLotteryNumber();
    generateAllLotteryNumbers();
    displayedNumbers = List.from(allLotteryNumbers);
  }

  void generateLotteryNumber() {
    final random = Random();
    setState(() {
      lotteryNumber =
          List.generate(6, (_) => random.nextInt(10).toString()).join();
    });
  }

  void generateAllLotteryNumbers() {
    final random = Random();
    setState(() {
      allLotteryNumbers = List.generate(
          100, (_) => random.nextInt(1000000).toString().padLeft(6, '0'));
    });
  }

  void searchLotteryNumbers(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedNumbers = List.from(allLotteryNumbers);
      } else {
        displayedNumbers = allLotteryNumbers
            .where((number) => number.contains(query))
            .toList();
      }
    });
  }

  void showLotteryDetail(String number) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return LotteryDetailDialog(lotteryNumber: number);
      },
    );

    if (result != null && result is Map<String, dynamic>) {
      final newTicket = LotteryTicket(
        number: result['number'],
        price: result['price'],
        isWinning: false,
        prize: 0,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PurchasePage(
            purchasedTickets: [newTicket],
            balance: balance,
            onBalanceUpdate: (value) {
              setState(() {
                balance = value;
              });
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String logo = 'assets/images/logo.jpg';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Image.asset(
                      logo,
                    ),
                  ),
                  Text(
                    '${balance.toStringAsFixed(2)} \$',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:
                            Colors.yellow, // Set the background color to yellow
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        border: Border.all(
                            color: Colors.black,
                            width: 1), // Border like the image
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '1st',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Black text for the '1st' label
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: lotteryNumber.split('').map((digit) {
                              return Container(
                                width: 50, // Adjust size as needed
                                height: 50, // Adjust size as needed
                                decoration: BoxDecoration(
                                  color: Colors.yellow[
                                      100], // Lighter yellow for the number boxes
                                  shape: BoxShape.circle, // Circle shape
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 1), // Black border
                                ),
                                child: Center(
                                  child: Text(
                                    digit,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Black text for the digits
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: searchLotteryNumbers,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: displayedNumbers.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              color: const Color.fromARGB(
                                  213, 90, 71, 172), // Pastel purple color
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.local_activity,
                                            color: Colors.black),
                                        const SizedBox(width: 8),
                                        Text(
                                          displayedNumbers[index],
                                          style: const TextStyle(
                                            fontFamily: 'Courier',
                                            fontSize: 24, // Larger text
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.shopping_cart,
                                          color: Colors.black),
                                      onPressed: () => showLotteryDetail(
                                          displayedNumbers[index]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'รายการ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            // Stay on this page
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PurchasePage(
                        purchasedTickets: const [],
                        balance: balance,
                        onBalanceUpdate: (value) {},
                      )),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
