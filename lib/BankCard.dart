class BankCard {
  final String type; // Debit / Credit
  final String maskedNumber;
  final String cardHolder;
  final String expiry;
  final String network; // VISA / MasterCard
  final String status; // Active / Blocked
  final String availableLimit;
  final String totalLimit;

  BankCard({
    required this.type,
    required this.maskedNumber,
    required this.cardHolder,
    required this.expiry,
    required this.network,
    required this.status,
    required this.availableLimit,
    required this.totalLimit,
  });
}
