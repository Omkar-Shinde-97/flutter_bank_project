import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({super.key});

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  bool showBalance = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Savings Account",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            Text(
              showBalance ? "₹ 1,25,430.00" : "₹ ••••••",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("A/C No: **** 4321"),
                TextButton.icon(
                  onPressed: () {
                    setState(() => showBalance = !showBalance);
                  },
                  icon: Icon(
                    showBalance
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  label: Text(showBalance ? "Hide" : "Show"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
