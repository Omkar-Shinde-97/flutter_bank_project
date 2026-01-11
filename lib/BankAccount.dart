class BankAccount {
  final String accountType;
  final String accountNumber;
  final String ifsc;
  final String bankName;
  final String branch;
  final String holderName;
  final String balance;
  final String availableBalance;
  final String openedOn;
  final String status;

  BankAccount({
    required this.accountType,
    required this.accountNumber,
    required this.ifsc,
    required this.bankName,
    required this.branch,
    required this.holderName,
    required this.balance,
    required this.availableBalance,
    required this.openedOn,
    required this.status,
  });
}
