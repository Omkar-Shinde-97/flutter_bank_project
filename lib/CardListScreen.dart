import 'package:flutter/material.dart';

import 'BankCard.dart';
import 'CardDetailScreen.dart';
import 'CardListItem.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      BankCard(
        type: "Debit Card",
        maskedNumber: "**** 4321",
        cardHolder: "OMKAR SHINDE",
        expiry: "12/28",
        network: "VISA",
        status: "Active",
        totalLimit: "₹1,00,000",
        availableLimit: "₹65,000",
      ),
      BankCard(
        type: "Credit Card",
        maskedNumber: "**** 9876",
        cardHolder: "OMKAR SHINDE",
        expiry: "09/27",
        network: "MasterCard",
        status: "Active",
        totalLimit: "₹2,50,000",
        availableLimit: "₹1,40,000",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cards")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CardDetailScreen(card: card)),
              );
            },
            child: CardListItem(card: card),
          );
        },
      ),
    );
  }
}
