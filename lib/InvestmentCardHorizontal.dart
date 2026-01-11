import 'package:flutter/material.dart';

import 'Investment.dart';

class InvestmentCardHorizontal extends StatelessWidget {
  final Investment investment;

  const InvestmentCardHorizontal(this.investment, {super.key});

  @override
  Widget build(BuildContext context) {
    final isPositive = investment.returnPercent >= 0;

    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.green.shade50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 NAME
          Text(
            investment.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          _infoRow("Invested", investment.invested),
          _infoRow("Current", investment.currentValue),

          const Divider(height: 20),

          /// 🔹 RETURNS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Returns"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    investment.profit,
                    style: TextStyle(
                      color: isPositive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${investment.returnPercent.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: isPositive ? Colors.green : Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// 🔹 RISK CHIP
          Chip(
            label: Text("Risk: ${investment.risk}"),
            backgroundColor: investment.risk == "High"
                ? Colors.red.shade50
                : investment.risk == "Medium"
                ? Colors.orange.shade50
                : Colors.green.shade50,
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
