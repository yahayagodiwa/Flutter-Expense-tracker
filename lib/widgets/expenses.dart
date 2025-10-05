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

  void _addExpense(ExpensesModel expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(ExpensesModel expense) {
    final expendeIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Expenses Delete"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expendeIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No expenses found"));

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
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
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
