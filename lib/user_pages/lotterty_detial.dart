import 'package:flutter/material.dart';

class LotteryDetailDialog extends StatefulWidget {
  final String lotteryNumber;

  const LotteryDetailDialog({super.key, required this.lotteryNumber});

  @override
  _LotteryDetailDialogState createState() => _LotteryDetailDialogState();
}

class _LotteryDetailDialogState extends State<LotteryDetailDialog> {
  int quantity = 1;
  final double pricePerTicket = 80;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('ยืนยันการสั่งซื้อหมายเลข',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.lotteryNumber,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('จำนวน'),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrementQuantity),
                  Text('$quantity', style: const TextStyle(fontSize: 18)),
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: incrementQuantity),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('ราคา'),
              Text('${(quantity * pricePerTicket).toStringAsFixed(2)} \$',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('ยกเลิก'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    'number': widget.lotteryNumber,
                    'quantity': quantity,
                    'price': pricePerTicket * quantity,
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('ยืนยัน'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
