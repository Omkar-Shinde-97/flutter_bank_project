import 'package:flutter/material.dart';

import 'BankCard.dart';

class CardListItem extends StatelessWidget {
  final BankCard card;

  const CardListItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.deepPurple],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.type,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(card.status),
                  backgroundColor: Colors.green.shade50,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              card.maskedNumber,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            /// 🔹 CARD INFO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _info("Expiry", card.expiry),
                _info("Network", card.network),
              ],
            ),

            const Divider(height: 24),

            /// 🔹 EXTRA BANK FEATURES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _feature(Icons.card_giftcard, "Rewards\n2,350 pts"),
                _feature(Icons.receipt_long, "Active EMI\n₹5,200"),
                _feature(Icons.support_agent, "Support"),
                _feature(Icons.block, "Block Card"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _feature(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 22, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
