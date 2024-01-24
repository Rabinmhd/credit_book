import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String purpose;
  @HiveField(2)
  double amount;
  @HiveField(3)
  String dateTime;
  TransactionModel({
    required this.name,
    required this.purpose,
    required this.amount,
    required this.dateTime,
  });
}
