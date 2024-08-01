import 'package:finance_app/state/income_state.dart/income_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incomeNOtifierProvider =
    StateNotifierProvider<IncomeNotifier, List<IncomeData>>((ref) {
  return IncomeNotifier([]);
});
