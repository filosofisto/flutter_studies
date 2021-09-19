import 'package:bank/components/commun/input_numeric_ui.dart';
import 'package:bank/model/transfer.dart';
import 'package:flutter/material.dart';

class TransferFormScreen extends StatefulWidget {
  const TransferFormScreen({Key? key}) : super(key: key);

  @override
  _TransferFormScreenState createState() => _TransferFormScreenState();
}

class _TransferFormScreenState extends State<TransferFormScreen> {

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputNumber(
                controller: _controllerAccount,
                text: 'Account',
                hint: '2356'
            ),
            InputNumber(
                controller: _controllerValue,
                text: 'Value',
                hint: '1500.36',
                icon: Icon(Icons.monetization_on)),
            ElevatedButton(
              onPressed: () {
                final transfer = Transfer(
                    account: _controllerAccount.text,
                    value: double.tryParse(_controllerValue.text)!);
                Navigator.pop(context, transfer);
              },
              child: Text('Save', style: TextStyle(fontSize: 24.0),),
            )
          ],
        ),
      ),
    );
  }
}

// class TransferFormUI extends StatelessWidget {
//   TransferFormUI({Key? key}) : super(key: key);
//
//   final TextEditingController _controllerAccount = TextEditingController();
//   final TextEditingController _controllerValue = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Transfer'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             InputNumber(
//                 controller: _controllerAccount,
//                 text: 'Account',
//                 hint: '2356'
//             ),
//             InputNumber(
//                 controller: _controllerValue,
//                 text: 'Value',
//                 hint: '1500.36',
//                 icon: Icon(Icons.monetization_on)),
//             ElevatedButton(
//               onPressed: () {
//                     final transfer = Transfer(
//                         account: _controllerAccount.text,
//                         value: double.tryParse(_controllerValue.text)!);
//                     Navigator.pop(context, transfer);
//               },
//               child: Text('Save'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
