import 'package:flutter/material.dart';

class CreditDetailsPage extends StatelessWidget {
  // final String creditName;
  // final double creditAmount;
  // final String creditDetails;

  CreditDetailsPage(
      //   {
      //   // required this.creditName,
      //   // required this.creditAmount,
      //   // required this.creditDetails,
      // }
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Credit Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Credit Amount: }',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Details:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(child: Text("Date")),
                Expanded(child: Text("Amount")),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(child: Text("13/06/2023")),
                        Expanded(
                          child: Text("1000/-"),
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
