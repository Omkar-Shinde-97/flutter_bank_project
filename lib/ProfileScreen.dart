import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// 👤 Header
          const ListTile(
            leading: CircleAvatar(
              radius: 28,
              child: Icon(Icons.person, size: 32),
            ),
            title: Text(
              "Omkar Shinde",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Customer ID: CUST123456"),
          ),

          const SizedBox(height: 12),

          /// 📌 PERSONAL DETAILS
          _sectionTitle("Personal Details"),
          _infoTile("Full Name", "Omkar Shinde"),
          _infoTile("Mobile Number", "+91 •••• •••• 21"),
          _infoTile("Email", "omkar@email.com"),
          _infoTile("Date of Birth", "14 Aug 1996"),

          /// 🪪 KYC DETAILS
          _sectionTitle("KYC Details"),
          _statusTile("Aadhaar", "Verified"),
          _statusTile("PAN", "Verified"),
          _statusTile("Address Proof", "Verified"),
          _statusTile("KYC Status", "Completed"),

          /// 🏠 ADDRESS DETAILS
          _sectionTitle("Address"),
          _infoTile(
            "Residential Address",
            "Flat 203, Sai Residency,\nWakad, Pune, Maharashtra - 411057",
          ),

          /// 🏦 ACCOUNT DETAILS
          _sectionTitle("Account Details"),
          _infoTile("Account Number", "XXXX XXXX 4321"),
          _infoTile("Account Type", "Savings Account"),
          _infoTile("IFSC Code", "HDFC0001234"),
          _infoTile("Branch", "Pune Wakad Branch"),

          /// 🔐 SECURITY & ACCESS
          _sectionTitle("Security & Access"),
          _infoTile("Biometric Login", "Enabled"),
          _infoTile("Last Login", "02 Jan 2026, 10:45 AM"),
          _infoTile("Registered Device", "Pixel 7 Pro"),

          /// ℹ️ APP INFO
          _sectionTitle("App Information"),
          _infoTile("App Version", "1.0.0"),
          _infoTile("Environment", "Production"),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ---------- Helper Widgets ----------

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }

  Widget _statusTile(String label, String status) {
    final isVerified = status == "Verified" || status == "Completed";

    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(label),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isVerified ? Icons.check_circle : Icons.error,
              color: isVerified ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 6),
            Text(
              status,
              style: TextStyle(
                color: isVerified ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
