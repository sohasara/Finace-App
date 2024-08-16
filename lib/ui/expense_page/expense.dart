import 'package:finance_app/state/expense_state/expense_provider.dart';
import 'package:finance_app/ui/expense_page/total_expense.dart';
import 'package:finance_app/ui/expense_page/view_expense.dart';
import 'package:finance_app/ui/expense_page/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();
    String formatedDate = DateFormat('dd-MM-yyyy').format(date);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpense(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        title: const Text(
          'EXPENSES',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
      drawer: const Drawer(),
      body: Consumer(builder: (context, ref, index) {
        final expense = ref.watch(expenseNotifierProvider);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 15.0,
                  top: 10,
                ),
                child: TotalExpensePage(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: expense.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              ref
                                  .read(expenseNotifierProvider.notifier)
                                  .removeExpense(index);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ],
                      ),
                      child: ShowExpense(
                        amount: expense[index].amount.toString(),
                        cat: expense[index].category,
                        date: formatedDate,
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
