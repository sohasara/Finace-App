// ignore_for_file: unnecessary_null_comparison

import 'package:finance_app/database/income_model/income_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IncomeNotifier extends StateNotifier<List<IncomeModel>> {
  final Box<IncomeModel>? _box;
  IncomeNotifier(super.state, this._box) {
    loadIncomes();
  }

  void loadIncomes() {
    if (_box != null) {
      state = _box.values.toList();
    }
  }

  void addIncome(double amount, String cat) {
    if (_box == null) {
      return;
    } else {
      final income = IncomeModel(amount: amount, category: cat);
      _box.add(income);
      state = [...state, income];
    }
  }

  void removeIncome(int index) {
    _box?.deleteAt(index);

    state = List.from(state)..removeAt(index);
  }
}
