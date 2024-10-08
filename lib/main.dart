//import 'package:finance_app/auth/sign_in.dart';
import 'package:finance_app/database/expense_model/expense_model.dart';
import 'package:finance_app/database/income_model/income_model.dart';
import 'package:finance_app/ui/navigation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  //await Hive.deleteBoxFromDisk('expenseBox');
  //await Hive.deleteBoxFromDisk('incomeBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      //home: const SignIn(),
      home: const NavigationB(),
    );
  }
}
