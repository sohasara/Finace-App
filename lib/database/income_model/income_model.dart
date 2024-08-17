// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';
part 'income_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel extends HiveObject {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String discirption;
  IncomeModel({
    required this.amount,
    required this.category,
    required this.time,
    required this.discirption,
  });
}
