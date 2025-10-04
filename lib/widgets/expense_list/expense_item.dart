import 'package:flutter/material.dart';
import 'package:interactives/models/expenses_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final ExpensesModel expense;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(expense.title),
              const SizedBox(height: 4),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('\$${expense.amount.toStringAsFixed(2)}'),
                Row(
                children: [
                  Icon(categoryIcon[expense.category]),
              
                  const SizedBox(width: 8,),
                  Text(expense.formattedDate)
                ],
              )
                ]
                ),
            ],
          ),
        ),
      ),
    );
  }
}
