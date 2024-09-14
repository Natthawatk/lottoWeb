import 'package:flutter/material.dart';
import 'package:lotto_application_1/user_pages/lottery_page.dart';
import 'package:lotto_application_1/user_pages/profile_page.dart';

class PurchasePage extends StatefulWidget {
  final List<LotteryTicket> purchasedTickets;
  final double balance;
  final Function(double) onBalanceUpdate;

  const PurchasePage({
    super.key,
    required this.purchasedTickets,
    required this.balance,
    required this.onBalanceUpdate,
  });

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  List<LotteryTicket> _tickets = [];

  @override
  void initState() {
    super.initState();
    _tickets = widget.purchasedTickets;
  }

  void _showWinningDialog(LotteryTicket ticket) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ยินดีด้วย!'),
          content: Text(
            'คุณถูกรางวัลที่ lottery หมายเลข ${ticket.number}\n'
            'ได้รับจำนวนเงิน ${ticket.prize.toStringAsFixed(2)} บาท',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('รับเงิน'),
              onPressed: () {
                setState(() {
                  widget.onBalanceUpdate(widget.balance + ticket.prize);
                  _tickets.removeWhere((t) => t.number == ticket.number);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
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
                    color: Colors.grey[300],
                    child: const Center(child: Text('Logo')),
                  ),
                  Text(
                    '${widget.balance.toStringAsFixed(2)} \$',
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
                    // Winning tickets
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'รายการที่ถูกรางวัล',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ...(_tickets
                              .where((ticket) => ticket.isWinning)
                              .map((ticket) => Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent, // bright green
                                      borderRadius: BorderRadius.circular(
                                          16), // rounded corners
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ticket.number,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      24), // larger font size
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              'ตรวจสอบ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              _showWinningDialog(ticket),
                                          child: const Icon(
                                            Icons.check_box,
                                            color: Colors.black,
                                            size: 30, // Larger check icon
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'รายการสลากที่ซื้อ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // Purchased tickets
                    Expanded(
                      child: ListView.builder(
                        itemCount: _tickets.length,
                        itemBuilder: (context, index) {
                          final ticket = _tickets[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300], // Light gray background
                              borderRadius:
                                  BorderRadius.circular(16), // Rounded corners
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ticket.number,
                                  style: const TextStyle(
                                      fontSize:
                                          24, // larger font size for numbers
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  'จำนวน ${index + 1}', // Display the quantity (example format)
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LotteryScreen(),
              ),
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

class LotteryTicket {
  final String number;
  final double price;
  final bool isWinning;
  final double prize;

  LotteryTicket({
    required this.number,
    required this.price,
    this.isWinning = false,
    this.prize = 0,
  });
}
