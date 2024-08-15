import 'package:finance_app/state/income_state.dart/income_provider.dart';
import 'package:finance_app/ui/income_page/add_income.dart';
import 'package:finance_app/ui/income_page/total_income.dart';
import 'package:finance_app/ui/income_page/view_income.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddIncome(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle,
              size: 30,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'INCOMES',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
        ),
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
            ),
            Text(
              'Nadia',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Consumer(builder: (context, ref, index) {
        final income = ref.watch(incomeNOtifierProvider);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const TotalIncome(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: income.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              ref
                                  .read(incomeNOtifierProvider.notifier)
                                  .removeIncome(index);
                            },
                            borderRadius: BorderRadius.circular(18),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: ShowIncome(
                        amount: income[index].amount.toString(),
                        cat: income[index].category,
                        date: formattedDate,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
