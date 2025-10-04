import 'package:flutter/material.dart';
import 'package:interactives/widgets/expense_list/expenses_list.dart';
import 'package:interactives/models/expenses_model.dart';
import 'package:interactives/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpensesModel> _registerExpenses = [
    ExpensesModel(
      title: "Flutter Courter",
      amount: 20.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpensesModel(
      title: "Expense",
      amount: 5.00,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => NewExpense(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(child: ExpensesList(expenses: _registerExpenses)),
        ],
      ),
    );
  }
}
