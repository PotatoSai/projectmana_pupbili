
import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_receipt_tile.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("We're Cooking!"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}
