import 'package:finance_app/state/saving_state.dart';
import 'package:finance_app/ui/saving_page/saving_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Savings extends ConsumerWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingValue = ref.watch(savingsProvider);
    final savingsHistory = ref.watch(savingsHistoryProvider);

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              size: 35,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'SAVINGS',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 220,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: savingValue.when(
                  data: (savings) => Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Total Saved Money',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${savings.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (err, stack) {
                    return Text('Error: $err');
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'HISTORY',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: savingsHistory.when(
                data: (historyList) => ListView.builder(
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    final historyItem = historyList[index];
                    return HistorySaaving(
                      month: historyItem['month'],
                      savedAmount: historyItem['amount'],
                    );
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text('Error: $err'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
