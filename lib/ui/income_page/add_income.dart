import 'package:finance_app/state/income_state.dart/income_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddIncome extends ConsumerWidget {
  const AddIncome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController amountController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
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
            fontWeight: FontWeight.bold,
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
            const Text(
              'Enter the Amount : ',
              style: TextStyle(
                fontSize: 23,
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
            const Text(
              'Enter the Catergory : ',
              style: TextStyle(
                fontSize: 23,
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
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                final String amount = amountController.text;
                final String category = categoryController.text;
                ref
                    .read(incomeNOtifierProvider.notifier)
                    .addIncome(amount, category);
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 160,
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
