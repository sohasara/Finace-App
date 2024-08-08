// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final String category;
  ExpenseModel({
    required this.amount,
    required this.category,
  });
}
