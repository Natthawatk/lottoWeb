import 'package:flutter/material.dart';

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

class LotteryProvider with ChangeNotifier {
  final List<LotteryTicket> _purchasedTickets = [];
  double _balance = 700.00;

  List<LotteryTicket> get purchasedTickets => _purchasedTickets;
  double get balance => _balance;

  void addTicket(LotteryTicket ticket) {
    _purchasedTickets.add(ticket);
    notifyListeners();
  }

  void updateBalance(double amount) {
    _balance = amount;
    notifyListeners();
  }
}
