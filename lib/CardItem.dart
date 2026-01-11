import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String type;
  final String number;

  const CardItem({
    super.key,
    required this.type,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.deepPurple],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
          const Text(
            "VALID THRU 12/28",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          )
        ],
      ),
    );
  }
}
