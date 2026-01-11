class BankTransaction {
  final String title;
  final String amount;
  final bool isCredit;
  final String date;
  final String referenceNo;
  final String balanceAfter;
  final String status;

  BankTransaction({
    required this.title,
    required this.amount,
    required this.isCredit,
    required this.date,
    required this.referenceNo,
    required this.balanceAfter,
    required this.status,
  });
}
