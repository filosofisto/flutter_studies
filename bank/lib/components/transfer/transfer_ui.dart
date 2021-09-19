import 'package:bank/model/transfer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferUI extends StatelessWidget {
  TransferUI(this.transfer);

  final Transfer transfer;
  final NumberFormat formatter =
      NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(formatter.format(transfer.value)),
        subtitle: Text(transfer.account),
      ),
    );
  }
}
