import 'package:flutter/material.dart';

import 'BankTransaction.dart';
import 'TransactionCard.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      BankTransaction(
        title: "Amazon Shopping",
        amount: "₹2,499",
        isCredit: false,
        date: "02 Jan 2026, 09:45 AM",
        referenceNo: "TXN98237465",
        balanceAfter: "₹1,25,430",
        status: "Success",
      ),
      BankTransaction(
        title: "Salary Credit",
        amount: "₹50,000",
        isCredit: true,
        date: "01 Jan 2026, 08:30 AM",
        referenceNo: "TXN98237410",
        balanceAfter: "₹1,27,929",
        status: "Success",
      ),
      BankTransaction(
        title: "Electricity Bill",
        amount: "₹1,200",
        isCredit: false,
        date: "28 Dec 2025, 06:15 PM",
        referenceNo: "TXN98237111",
        balanceAfter: "₹77,929",
        status: "Success",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(txn: transactions[index]);
        },
      ),
    );
  }
}
