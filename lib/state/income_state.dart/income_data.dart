import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeData {
  final String amount;
  final String category;

  IncomeData({
    required this.amount,
    required this.category,
  });
}

class IncomeNotifier extends StateNotifier<List<IncomeData>> {
  IncomeNotifier(super.state);

  void addIncome(String amount, String cat) {
    state = [...state, IncomeData(amount: amount, category: cat)];
  }

  void removeIncome(int index) {
    state = List.from(state)..removeAt(index);
  }
}
