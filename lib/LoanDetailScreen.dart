import 'package:flutter/material.dart';

import 'Loan.dart';

class LoanDetailScreen extends StatelessWidget {
  final Loan loan;

  const LoanDetailScreen({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    final paidEmis = loan.tenureMonths - loan.remainingEmis;

    return Scaffold(
      appBar: AppBar(title: Text(loan.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 LOAN SUMMARY
            _summaryCard(),

            const SizedBox(height: 24),

            /// 🔹 EMI PROGRESS
            _sectionTitle("Repayment Progress"),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: paidEmis / loan.tenureMonths,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 8),
            Text(
              "$paidEmis / ${loan.tenureMonths} EMIs paid",
              style: const TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 24),

            /// 🔹 LOAN DETAILS
            _sectionTitle("Loan Details"),
            _infoRow("Loan Amount", loan.loanAmount),
            _infoRow("Outstanding", loan.outstandingAmount),
            _infoRow("Interest Rate", "${loan.interestRate}% p.a."),
            _infoRow("Tenure", "${loan.tenureMonths} months"),
            _infoRow("Remaining EMIs", loan.remainingEmis.toString()),
            _infoRow("Next EMI Date", loan.nextEmiDate),

            const SizedBox(height: 24),

            /// 🔹 TRANSACTIONS
            _sectionTitle("Recent EMI Transactions"),
            const SizedBox(height: 8),
            ...loan.transactions.map(_transactionTile),

            const SizedBox(height: 32),

            /// 🔹 ACTIONS
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Download Statement"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Pay EMI"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ================= SUMMARY =================
  Widget _summaryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryRow("EMI Amount", loan.emiAmount),
            const Divider(),
            _summaryRow("Outstanding Balance", loan.outstandingAmount),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// ================= HELPERS =================
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _transactionTile(LoanTransaction txn) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(txn.amount),
        subtitle: Text(txn.date),
        trailing: Text(
          txn.status,
          style: TextStyle(
            color: txn.status == "Paid" ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
