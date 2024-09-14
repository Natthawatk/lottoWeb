import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เติมเงินเข้าบัญชี'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Image.network(
                    'https://th.qr-code-generator.com/', // ใส่ URL ของรูปภาพ QR ที่ต้องการ
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 10),
                  const Text('User Lottery', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'จำนวนเงิน',
                      prefixText: '\$ ',
                      border: OutlineInputBorder(),
                      hintText: '0.01 - 500,000',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Implement save QR code functionality
                        },
                        icon: const Icon(Icons.save_alt),
                        label: const Text('บันทึกรูปคิวอาร์โค้ด'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Implement print QR code functionality
                        },
                        icon: const Icon(Icons.print),
                        label: const Text('พิมพ์คิวอาร์โค้ด'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
