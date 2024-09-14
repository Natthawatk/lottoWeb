import 'package:flutter/material.dart';
import 'package:lotto_application_1/user_pages/topuppage.dart';

class WalletPage extends StatelessWidget {
  final double balance;
  final double accountLimit;
  // final List<Transaction> transactions;

  const WalletPage({
    super.key,
    required this.balance,
    required this.accountLimit,
    // required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ยอดเงินในบัญชี'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceCard(),
            _buildAccountLimitCard(),
            _buildTopUpButton(context),
            _buildTransactionHistory(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ยอดเงินคงเหลือ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${balance.toStringAsFixed(2)} บาท',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountLimitCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'วงเงินในบัญชี',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '${accountLimit.toStringAsFixed(2)} บาท',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TopupPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text('เติมเงิน'),
      ),
    );
  }

  Widget _buildTransactionHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ประวัติการทำรายการ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to full transaction history
                },
                child: const Text('ดูทั้งหมด'),
              ),
            ],
          ),
        ),
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   // itemCount: transactions.length > 3 ? 3 : transactions.length,
        //   itemBuilder: (context, index) {
        //     final transaction = transactions[index];
        //     return ListTile(
        //       title: Text(transaction.title),
        //       subtitle: Text(transaction.date),
        //       trailing: Text(
        //         '${transaction.amount.toStringAsFixed(2)} บาท',
        //         style: TextStyle(
        //           color: transaction.amount < 0 ? Colors.red : Colors.green,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}

class Transaction {
  final String title;
  final String date;
  final double amount;

  Transaction({required this.title, required this.date, required this.amount});
}
