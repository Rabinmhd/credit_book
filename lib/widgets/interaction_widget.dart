import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InteractionTile extends StatelessWidget {
  String name;
  String type;
  String time;
  double amount;
  InteractionTile(
      {super.key,
      required this.name,
      required this.type,
      required this.amount,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(name),
                ),
                Expanded(
                  child: Text(type),
                ),
                Expanded(
                  child: Text(time),
                ),
                Expanded(
                  child: Text(
                    amount.toString(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
