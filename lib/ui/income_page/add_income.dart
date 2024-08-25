import 'package:finance_app/state/income_state.dart/income_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddIncome extends ConsumerWidget {
  final String? cat;
  final String? des;
  final int? index;
  final double? amount;
  final String? time;

  const AddIncome({
    super.key,
    required this.amount,
    required this.cat,
    required this.des,
    required this.index,
    required this.time,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    TextEditingController amountController = TextEditingController(
      text: amount?.toString(),
    );
    TextEditingController categoryController = TextEditingController(
      text: cat,
    );
    TextEditingController discriptionController = TextEditingController(
      text: des,
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
        title: const Text(
          'ADD YOUR INCOME ',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.green,
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
                color: Colors.green[700],
              ),
            ),
            TextField(
              controller: amountController,
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
                color: Colors.green[700],
              ),
            ),
            TextField(
              controller: categoryController,
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
                color: Colors.green[700],
              ),
            ),
            SizedBox(
              height: 150,
              child: TextField(
                controller: discriptionController,
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
                final String amount = amountController.text;
                final String category = categoryController.text;
                final String dis = discriptionController.text;
                if (index != null) {
                  ref.read(incomeNOtifierProvider.notifier).updateIncome(
                      double.parse(amount),
                      category,
                      formattedDate,
                      dis,
                      index!);
                } else {
                  ref.read(incomeNOtifierProvider.notifier).addIncome(
                        double.parse(amount),
                        category,
                        formattedDate,
                        dis,
                      );
                }
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  height: 55,
                  width: 180,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
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
