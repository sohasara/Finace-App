import 'package:finance_app/state/income_state.dart/income_provider.dart';
import 'package:finance_app/ui/income_page/add_income.dart';
import 'package:finance_app/ui/income_page/income_detailes.dart';
import 'package:finance_app/ui/income_page/income_drawer.dart';
import 'package:finance_app/ui/income_page/total_income.dart';
import 'package:finance_app/ui/income_page/view_income.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'ADD INCOME',
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
            fontWeight: FontWeight.w800,
            color: Colors.green[600],
          ),
        ),
      ),
      drawer: const Drawer(
        child: IncomeDrawer(),
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
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                            ),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            autoClose: true,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              ref
                                  .read(incomeNOtifierProvider.notifier)
                                  .removeIncome(index);
                            },
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            autoClose: true,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailesIncome(
                                index: index,
                                amount: income[index].amount.toString(),
                                des: income[index].discirption,
                                cat: income[index].category,
                                time: income[index].time,
                              ),
                            ),
                          );
                        },
                        child: ShowIncome(
                          amount: income[index].amount.toString(),
                          cat: income[index].category,
                          date: income[index].time,
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
