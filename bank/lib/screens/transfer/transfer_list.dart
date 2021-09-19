import 'package:bank/components/transfer/transfer_ui.dart';
import 'package:bank/model/transfer.dart';
import 'package:bank/screens/transfer/tranfer_form.dart';
import 'package:flutter/material.dart';

class TransferListScreen extends StatefulWidget {
  TransferListScreen({Key? key}) : super(key: key);

  final List<Transfer> _list = [];

  @override
  _TransferListScreenState createState() => _TransferListScreenState();
}

class _TransferListScreenState extends State<TransferListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Transfers'),
        ),
        body: ListView.builder(
            itemCount: widget._list.length,
            itemBuilder: (context, index) => TransferUI(widget._list[index])),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              final Future future =
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TransferFormScreen();
              }));

              future.then((transfer) => _updateList(transfer));
            }));
  }

  void _updateList(Transfer? transfer) {
    if (transfer != null) {
      setState(() => widget._list.add(transfer));
    }
  }
}
