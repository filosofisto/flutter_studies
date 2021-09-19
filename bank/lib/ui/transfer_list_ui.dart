import 'package:bank/model/transfer.dart';
import 'package:bank/ui/tranfer_form_ui.dart';
import 'package:bank/ui/transfer_ui.dart';
import 'package:flutter/material.dart';

class TransferListUI extends StatefulWidget {
  TransferListUI({Key? key}) : super(key: key);

  final List<Transfer> _list = [];

  @override
  _TransferListUIState createState() => _TransferListUIState();
}

class _TransferListUIState extends State<TransferListUI> {

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
                return TransferFormUI();
              }));

              future.then((transfer) => {
                    if (transfer != null) {
                      setState(() => widget._list.add(transfer))
                    }
                  });
            }));
  }
}
