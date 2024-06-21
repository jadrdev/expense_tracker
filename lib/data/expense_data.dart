import 'package:expense_tracker/data/datetime/date_time_helper.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  // List of All expenses

  List<ExpenseItem> overallExpenseList = [];

  // get expense list

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  // add new expense

  void addExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  // delete expense

  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }

  //get weekday (mon, tues) from a date object

  String getDayName(DateTime datetime) {
    switch (datetime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Mon';
    }
  }

  // get the date for the start of the week (Monday)
  DateTime startOfWeek(DateTime datetime) {
    DateTime? starOfWeek;

    //get today date
    DateTime today = DateTime.now();

    // go to backwards from today to find monday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Mon') {
        starOfWeek = today.subtract(Duration(days: i));
      }
    }

    return starOfWeek!;
  }

  /*

  convert overall expense into a dialy expense summary

  e.g.

  overallExpense = 

  [
  
  [food, 2024/01/30, 10€],
  [hat, 2024/01/30, 15€],
  [drink, 2024/01/31, 5€],
  [food, 2024/02/01, 10€],
  [food, 2024/02/02, 5€],
  [food, 2024/02/03, 15€],
  [food, 2024/02/04, 50€],
  [food, 2024/02/05, 100€],
  
  
  ]


  ->


  DailyExpenseSummary = 
  [
    [2024/01/30, 25€],
    [2024/01/31, 5€],
    [2024/02/01, 10€],
    [2024/02/02, 5€],
    [2024/02/03, 15€],
    [2024/02/04, 50€],
    [2024/02/05, 100€],


  ]
  

  */

  Map <String, double> calculateDailyExpenseSummary() {
    Map <String, double> dailyExpenseSummary = {
    //date (yyymmdd) : amountTotalForDay
  };

  for (var expense in overallExpenseList) {
    String date = convertDateTimeToString(expense.dateTime);
    double amount = double.parse(expense.amount);

    if (dailyExpenseSummary.containsKey(date)) {
      double currentAmount = dailyExpenseSummary[date]!;
      currentAmount += amount;
      dailyExpenseSummary[date] = currentAmount;
    } else {
      dailyExpenseSummary.addAll({date: amount});
    }
  }
  return dailyExpenseSummary;
  }

}
