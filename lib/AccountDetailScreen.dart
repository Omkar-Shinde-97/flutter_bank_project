import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BankAccount.dart';

class AccountDetailScreen extends StatelessWidget {
  final BankAccount account;

  const AccountDetailScreen({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 ACCOUNT SUMMARY
            _summaryCard(),

            const SizedBox(height: 24),

            /// 🔹 ACCOUNT INFORMATION
            _sectionTitle("Account Information"),
            _infoTile("Account Holder", account.holderName),
            _infoTile("Account Number", account.accountNumber, copyable: true),
            _infoTile("Account Type", account.accountType),
            _infoTile("Account Status", account.status),

            const SizedBox(height: 24),

            /// 🔹 BANK DETAILS
            _sectionTitle("Bank Details"),
            _infoTile("Bank Name", account.bankName),
            _infoTile("Branch", account.branch),
            _infoTile("IFSC Code", account.ifsc, copyable: true),

            const SizedBox(height: 24),

            /// 🔹 ADDITIONAL DETAILS
            _sectionTitle("Additional Information"),
            _infoTile("Account Opened On", account.openedOn),

            const SizedBox(height: 32),

            /// 🔹 ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text("Statement"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text("Share Details"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ================= SUMMARY CARD =================
  Widget _summaryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryRow("Total Balance", account.balance),
            const Divider(),
            _summaryRow("Available Balance", account.availableBalance),
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

  Widget _infoTile(String label, String value, {bool copyable = false}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: const TextStyle(color: Colors.black54)),
      subtitle: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      trailing: copyable
          ? IconButton(
        icon: const Icon(Icons.copy, size: 18),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: value));
        },
      )
          : null,
    );
  }
}
