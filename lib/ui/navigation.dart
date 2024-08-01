import 'package:finance_app/state/index_state.dart';
import 'package:finance_app/ui/expense_page/expense.dart';

import 'package:finance_app/ui/income_page/income.dart';
import 'package:finance_app/ui/saving_page/saving.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationB extends ConsumerWidget {
  const NavigationB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> selectedColors = [
      Colors.green,
      const Color(0xFFEF5350),
      const Color(0xFFAB47BC),
    ];
    final slectedIndex = ref.watch(bottomProvider);

    return Scaffold(
      body: IndexedStack(
        index: slectedIndex,
        children: const [
          IncomePage(),
          Expense(),
          Savings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: selectedColors[slectedIndex],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: slectedIndex,
        onTap: (index) {
          ref.read(bottomProvider.notifier).state = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons8-money-50.png',
              width: 40,
              height: 40,
            ),
            label: 'income',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons8-money-100.png',
              width: 40,
              height: 40,
            ),
            label: 'expense',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons8-money-48.png',
              width: 40,
              height: 40,
            ),
            label: 'savings',
          ),
        ],
      ),
    );
  }
}
