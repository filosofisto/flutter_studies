
class Transfer {

  final double value;
  final String account;

  Transfer({required this.value, required this.account});

  @override
  String toString() {
    return '$account | $value';
  }
}