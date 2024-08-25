import 'package:finance_app/state/expense_state/expense_provider.dart';
import 'package:finance_app/ui/expense_page/expense_detailes.dart';
import 'package:finance_app/ui/expense_page/total_expense.dart';
import 'package:finance_app/ui/expense_page/view_expense.dart';
import 'package:finance_app/ui/expense_page/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpense(
                    amount: null,
                    index: null,
                    category: '',
                    description: '',
                    time: '',
                  ),
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
            fontWeight: FontWeight.w900,
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
                            label: 'delete',
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                            ),
                            autoClose: true,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddExpense(
                                    amount: expense[index].amount,
                                    time: expense[index].time,
                                    description: expense[index].description,
                                    category: expense[index].category,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                            label: 'edit',
                            autoClose: true,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailesExpense(
                                amount: expense[index].amount.toString(),
                                cat: expense[index].category,
                                des: expense[index].description,
                                time: expense[index].time,
                              ),
                            ),
                          );
                        },
                        child: ShowExpense(
                          amount: expense[index].amount.toString(),
                          cat: expense[index].category,
                          date: expense[index].time,
                        ),
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
