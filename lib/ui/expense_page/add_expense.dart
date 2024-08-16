// ignore_for_file: avoid_print

import 'package:finance_app/state/expense_state/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddExpense extends ConsumerWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = DateTime.now();
    String formatedDate = DateFormat('dd-MM-yyyy').format(date);
    TextEditingController amountControler = TextEditingController();
    TextEditingController categoryControler = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              size: 28,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'ADD YOUR EXPENSE ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[900],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Enter the Amount : ',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            TextField(
              controller: amountControler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Enter the Catergory : ',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            TextField(
              controller: categoryControler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                String amountStr = amountControler.text;
                String cat = categoryControler.text;
                if (amountStr != '' && cat != '') {
                  double amount = double.parse(amountStr);

                  ref
                      .read(expenseNotifierProvider.notifier)
                      .addExpense(amount, cat, formatedDate);

                  Navigator.pop(context);
                }
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        18,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
