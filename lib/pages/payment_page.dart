import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_buttons.dart';
import 'package:projectmana_pupbili/components/my_text_field.dart';
import 'package:projectmana_pupbili/pages/receipt_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  //user wants to pay with Gcash
  void userTappedGcash() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Gcash Number: ${numberController.text}"),
                Text("Amount: ${amountController.text}")
              ],
            ),
          ),
          actions: [
            //yes button
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReceiptPage()),
              ),
              child: const Text("Yes"),
            ),

            //cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            )
          ],
        )
    );
  }

  void userTappedCash() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Please Pay: ${amountController.text}")
              ],
            ),
          ),
          actions: [
            //yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptPage()),
                );
              },
              child: const Text("Yes"),
            ),

            //cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
                controller: numberController,
                hintText: "Gcash Number",
                obscureText: false),

            const SizedBox(height: 10),
            MyTextField(
                controller: amountController,
                hintText: "Amount",
                obscureText: false),

            const SizedBox(height: 20),
            MyButton(
                text: "Pay with GCash",
                onTap: userTappedGcash),

            const SizedBox(height: 20),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 20),
            MyButton(
              text: "Pay Over-the-Counter",
              onTap: userTappedCash,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
