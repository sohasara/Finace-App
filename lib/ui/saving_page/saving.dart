import 'package:finance_app/ui/graphs/add_graph.dart';

import 'package:flutter/material.dart';

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const AddGraph(),
    );
  }
}
