import 'package:flutter/material.dart';

import 'BankTransaction.dart';

class TransactionCard extends StatelessWidget {
  final BankTransaction txn;

  const TransactionCard({super.key, required this.txn});

  @override
  Widget build(BuildContext context) {
    final amountColor = txn.isCredit ? Colors.green : Colors.red;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 TITLE + AMOUNT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  txn.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  (txn.isCredit ? "+ " : "- ") + txn.amount,
                  style: TextStyle(
                    color: amountColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            /// 🔹 DATE
            Text(
              txn.date,
              style: const TextStyle(color: Colors.black54),
            ),

            const Divider(height: 20),

            /// 🔹 REF NO
            _infoRow("Ref No", txn.referenceNo),

            /// 🔹 TRANSACTION TYPE
            _infoRow("Type", txn.isCredit ? "Credit" : "Debit"),

            /// 🔹 BALANCE AFTER
            _infoRow("Balance After", txn.balanceAfter),

            /// 🔹 STATUS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status: ", style: const TextStyle(color: Colors.black54)),
                Chip(
                  label: Text(txn.status),
                  backgroundColor:
                  txn.status == "Success"
                      ? Colors.green.shade50
                      : Colors.orange.shade50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
