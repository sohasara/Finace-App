import 'package:finance_app/database/income_model/income_model.dart';
import 'package:finance_app/state/income_state.dart/income_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final incomeBoxProvider = FutureProvider<Box<IncomeModel>>((ref) async {
  return await Hive.openBox<IncomeModel>('incomeBox');
});
final incomeNOtifierProvider =
    StateNotifierProvider<IncomeNotifier, List<IncomeModel>>((ref) {
  final box = ref
      .watch(incomeBoxProvider)
      .maybeWhen(data: (box) => box, orElse: () => null);

  return IncomeNotifier([], box);
});
