import 'package:flutter/material.dart';

import 'BankCard.dart';

class CardDetailScreen extends StatelessWidget {
  final BankCard card;

  const CardDetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(card.type)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 CARD PREVIEW
            _cardPreview(),

            const SizedBox(height: 24),

            /// 🔹 CARD INFO
            _sectionTitle("Card Information"),
            _infoRow("Card Number", card.maskedNumber),
            _infoRow("Card Holder", card.cardHolder),
            _infoRow("Expiry Date", card.expiry),
            _infoRow("Network", card.network),
            _infoRow("Status", card.status),

            const SizedBox(height: 24),

            /// 🔹 LIMITS
            _sectionTitle("Limits"),
            _infoRow("Total Limit", card.totalLimit),
            _infoRow("Available Limit", card.availableLimit),

            const SizedBox(height: 24),

            /// 🔹 ACTIONS
            _sectionTitle("Card Controls"),
            _actionTile(Icons.lock, "Block Card"),
            _actionTile(Icons.tune, "Set Spending Limit"),
            _actionTile(Icons.receipt_long, "View Statement"),
            _actionTile(Icons.pin, "Change PIN"),
          ],
        ),
      ),
    );
  }

  /// ================= CARD UI =================
  Widget _cardPreview() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.deepPurple],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(card.type,
              style: const TextStyle(color: Colors.white, fontSize: 18)),

          Text(
            card.maskedNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card.cardHolder,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                card.expiry,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= HELPERS =================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
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

  Widget _actionTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
