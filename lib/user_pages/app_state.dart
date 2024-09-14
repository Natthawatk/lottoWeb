// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class AppState with ChangeNotifier {
//   List<LotteryTicket> _tickets = [];
//   double _balance = 0;

//   List<LotteryTicket> get tickets => _tickets;
//   double get balance => _balance;

//   void addTicket(LotteryTicket ticket) {
//     _tickets.add(ticket);
//     notifyListeners();
//     saveTickets();
//   }

//   void updateBalance(double newBalance) {
//     _balance = newBalance;
//     notifyListeners();
//     saveBalance();
//   }

//   Future<void> saveTickets() async {
//     final prefs = await SharedPreferences.getInstance();
//     final ticketStrings =
//         _tickets.map((ticket) => jsonEncode(ticket.toMap())).toList();
//     await prefs.setStringList('tickets', ticketStrings);
//   }

//   Future<void> loadTickets() async {
//     final prefs = await SharedPreferences.getInstance();
//     final ticketStrings = prefs.getStringList('tickets') ?? [];
//     _tickets = ticketStrings
//         .map((str) => LotteryTicket.fromMap(jsonDecode(str)))
//         .toList();
//     notifyListeners();
//   }

//   Future<void> saveBalance() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble('balance', _balance);
//   }

//   Future<void> loadBalance() async {
//     final prefs = await SharedPreferences.getInstance();
//     _balance = prefs.getDouble('balance') ?? 0;
//     notifyListeners();
//   }
// }

// class LotteryTicket {
//   final String number;
//   final double price;
//   final bool isWinning;
//   final double prize;

//   LotteryTicket({
//     required this.number,
//     required this.price,
//     this.isWinning = false,
//     this.prize = 0,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'number': number,
//       'price': price,
//       'isWinning': isWinning,
//       'prize': prize,
//     };
//   }

//   factory LotteryTicket.fromMap(Map<String, dynamic> map) {
//     return LotteryTicket(
//       number: map['number'],
//       price: map['price'],
//       isWinning: map['isWinning'],
//       prize: map['prize'],
//     );
//   }
// }
