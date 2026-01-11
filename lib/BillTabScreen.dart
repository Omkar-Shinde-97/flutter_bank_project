import 'package:flutter/material.dart';

import 'BillItem.dart' show BillItem;

class BillTabScreen extends StatelessWidget {
  const BillTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [

        /// 🔹 QUICK PAY
        _sectionTitle("Pay Bills"),
        const SizedBox(height: 12),

        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: const [
            BillItem(icon: Icons.flash_on, label: "Electricity"),
            BillItem(icon: Icons.wifi, label: "Broadband"),
            BillItem(icon: Icons.phone_android, label: "Mobile"),
            BillItem(icon: Icons.local_gas_station, label: "Gas"),
            BillItem(icon: Icons.water_drop, label: "Water"),
            BillItem(icon: Icons.tv, label: "DTH"),
          ],
        ),

        const SizedBox(height: 24),

        /// 🔹 RECENT BILLS
        _sectionTitle("Recent Bills"),
        const SizedBox(height: 12),

        _recentBillTile("Electricity", "₹1,450", "Paid"),
        _recentBillTile("Mobile Recharge", "₹299", "Paid"),
        _recentBillTile("Broadband", "₹999", "Pending"),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _recentBillTile(String title, String amount, String status) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.receipt_long),
        title: Text(title),
        subtitle: Text(status),
        trailing: Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
