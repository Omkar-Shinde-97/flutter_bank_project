import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Investment.dart';

class InvestmentDetailScreen extends StatelessWidget {
  final Investment investment;

  const InvestmentDetailScreen({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    final isPositive = investment.returnPercent >= 0;

    return Scaffold(
      appBar: AppBar(title: Text(investment.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 SUMMARY CARD
            _summaryCard(isPositive),

            const SizedBox(height: 24),

            /// 🔹 PERFORMANCE CHART
            const Text(
              "Performance",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            performanceChart(),

            const SizedBox(height: 24),

            /// 🔹 INVESTMENT DETAILS
            const Text(
              "Investment Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _detailRow("Category", investment.category),
            _detailRow("Risk Level", investment.risk),
            _detailRow("Fund Type", investment.type),
            _detailRow("Expense Ratio", "1.2%"),
            _detailRow("Lock-in Period", "None"),

            const SizedBox(height: 32),

            /// 🔹 ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Redeem"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Invest More"),
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
  Widget _summaryCard(bool isPositive) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryRow("Invested Amount", investment.invested),
            _summaryRow("Current Value", investment.currentValue),
            const Divider(),
            _summaryRow(
              "Total Returns",
              investment.profit,
              valueColor: isPositive ? Colors.green : Colors.red,
            ),
            Text(
              "${investment.returnPercent.toStringAsFixed(2)}%",
              style: TextStyle(
                color: isPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= DETAILS =================
  Widget _detailRow(String label, String value) {
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

  /// ================= CHART =================

  Widget performanceChart() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 5,
          minY: 100,
          maxY: 160,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 110),
                FlSpot(1, 115),
                FlSpot(2, 120),
                FlSpot(3, 130),
                FlSpot(4, 145),
                FlSpot(5, 155),
              ],
              isCurved: true,
              color: Colors.green,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.green.withOpacity(0.4),
                    Colors.green.withOpacity(0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
