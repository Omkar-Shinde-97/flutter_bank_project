class Loan {
  final String title;
  final String loanAmount;
  final String outstandingAmount;
  final String emiAmount;
  final int tenureMonths;
  final int remainingEmis;
  final double interestRate;
  final String nextEmiDate;
  final List<LoanTransaction> transactions;

  Loan({
    required this.title,
    required this.loanAmount,
    required this.outstandingAmount,
    required this.emiAmount,
    required this.tenureMonths,
    required this.remainingEmis,
    required this.interestRate,
    required this.nextEmiDate,
    required this.transactions,
  });
}

class LoanTransaction {
  final String date;
  final String amount;
  final String status;

  LoanTransaction({
    required this.date,
    required this.amount,
    required this.status,
  });
}
