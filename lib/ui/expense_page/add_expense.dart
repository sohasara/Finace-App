// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:finance_app/state/expense_state/expense_provider.dart';

class AddExpense extends ConsumerWidget {
  final String? category;
  final double? amount;
  final int? index;
  final String? time;
  final String? description;
  const AddExpense({
    super.key,
    this.category,
    this.amount,
    this.index,
    this.time,
    this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = DateTime.now();
    String formatedDate = DateFormat('dd-MM-yyyy').format(date);
    TextEditingController amountControler = TextEditingController(
      text: amount?.toString(),
    );
    TextEditingController categoryControler =
        TextEditingController(text: category);
    TextEditingController desControler = TextEditingController(
      text: description,
    );
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
            fontWeight: FontWeight.w800,
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
            Text(
              ' Amount : ',
              style: TextStyle(
                fontSize: 23,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
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
            Text(
              ' Catergory : ',
              style: TextStyle(
                fontSize: 23,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
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
              height: 20,
            ),
            Text(
              ' Discription (Optional) : ',
              style: TextStyle(
                fontSize: 23,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
              child: TextField(
                controller: desControler,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
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
                double amount = double.parse(amountStr);
                if (index != null) {
                  ref.read(expenseNotifierProvider.notifier).updateExpense(
                        amount,
                        cat,
                        formatedDate,
                        desControler.text,
                        index!,
                      );
                } else if (amountStr != '' && cat != '') {
                  ref.read(expenseNotifierProvider.notifier).addExpense(
                        amount,
                        cat,
                        formatedDate,
                        desControler.text,
                      );
                }
                Navigator.pop(context);
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
