import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InteractionTile extends StatelessWidget {
  String name;
  String type;
  double amount;
  InteractionTile({
    super.key,
    required this.name,
    required this.type,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(name), Text(type), Text(amount.toString())],
        ),
      ],
    );
  }
}
