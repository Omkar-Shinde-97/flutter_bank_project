import 'package:flutter/material.dart';

import 'AccountCard.dart';
import 'AccountDetailScreen.dart';
import 'BankAccount.dart';
import 'BankCard.dart';
import 'CardDetailScreen.dart';
import 'CardItem.dart';
import 'Investment.dart';
import 'InvestmentCardHorizontal.dart';
import 'InvestmentDetailScreen.dart';
import 'Loan.dart';
import 'LoanDetailScreen.dart';
import 'LoanItem.dart';
import 'SectionTitle.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final investments = [
      Investment(
        name: "Axis Bluechip Fund",
        invested: "₹2,00,000",
        currentValue: "₹2,65,000",
        profit: "+₹65,000",
        returnPercent: 32.5,
        risk: "High",
        category: "Equity Mutual Fund",
        type: "Large Cap",
      ),

      Investment(
        name: "HDFC Fixed Deposit",
        invested: "₹3,00,000",
        currentValue: "₹3,45,000",
        profit: "+₹45,000",
        returnPercent: 15.0,
        risk: "Low",
        category: "Fixed Deposit",
        type: "5 Years FD",
      ),

      Investment(
        name: "Nifty 50 Index Fund SIP",
        invested: "₹1,20,000",
        currentValue: "₹1,55,000",
        profit: "+₹35,000",
        returnPercent: 29.1,
        risk: "Medium",
        category: "Index Fund",
        type: "Monthly SIP",
      ),

      Investment(
        name: "SBI Small Cap Fund",
        invested: "₹80,000",
        currentValue: "₹1,05,000",
        profit: "+₹25,000",
        returnPercent: 31.2,
        risk: "High",
        category: "Equity Mutual Fund",
        type: "Small Cap",
      ),

      Investment(
        name: "ICICI Debt Fund",
        invested: "₹1,50,000",
        currentValue: "₹1,68,000",
        profit: "+₹18,000",
        returnPercent: 12.0,
        risk: "Low",
        category: "Debt Mutual Fund",
        type: "Short Term",
      ),
    ];

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
    final loans = [
      Loan(
        title: "Car Loan",
        loanAmount: "₹8,50,000",
        outstandingAmount: "₹5,20,000",
        emiAmount: "₹14,500",
        tenureMonths: 60,
        remainingEmis: 36,
        interestRate: 9.2,
        nextEmiDate: "05 Feb 2026",
        transactions: [
          LoanTransaction(
            date: "05 Jan 2026",
            amount: "₹14,500",
            status: "Paid",
          ),
          LoanTransaction(
            date: "05 Dec 2025",
            amount: "₹14,500",
            status: "Paid",
          ),
        ],
      ),
      Loan(
        title: "Home Loan",
        loanAmount: "₹45,00,000",
        outstandingAmount: "₹38,20,000",
        emiAmount: "₹36,800",
        tenureMonths: 240,
        remainingEmis: 198,
        interestRate: 8.6,
        nextEmiDate: "10 Feb 2026",
        transactions: [],
      ),
    ];

    final account = BankAccount(
      accountType: "Savings Account",
      accountNumber: "1234567894321",
      ifsc: "HDFC0001234",
      bankName: "HDFC Bank",
      branch: "Wai Branch",
      holderName: "Omkar Shinde",
      balance: "₹1,25,430.00",
      availableBalance: "₹1,24,980.00",
      openedOn: "12 Mar 2019",
      status: "Active",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/transactions');
            },
            icon: const Icon(Icons.receipt_long),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// Saving Account Card
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AccountDetailScreen(account: account),
                ),
              );
            },
            child: const AccountCard(),
          ),

          const SizedBox(height: 16),

          /// Cards Section
          SectionTitle("Your Cards"),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CardDetailScreen(card: card),
                      ),
                    );
                  },
                  child: CardItem(type: card.type, number: card.maskedNumber),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          /// Loans
          SectionTitle("Your Loans"),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: loans.length,
              itemBuilder: (context, index) {
                final loan = loans[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoanDetailScreen(loan: loan),
                      ),
                    );
                  },
                  child: LoanItem(title: loan.title),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          /// Investments
          SectionTitle("Your Investments"),
          const SizedBox(height: 8),

          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: investments.length,
              itemBuilder: (context, index) {
                final investment = investments[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            InvestmentDetailScreen(investment: investment),
                      ),
                    );
                  },
                  child: InvestmentCardHorizontal(investment),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
