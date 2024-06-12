import 'package:expense_tracker/models/expense_item.dart';

class ExpenseData{

  // List of All expenses

  List<ExpenseItem> overallExpenseList = [];


  // get expense list

  List<ExpenseItem> getExpenseList(){
    return overallExpenseList;
  }

  
  // add new expense

  void addExpense(ExpenseItem newExpense){
    overallExpenseList.add(newExpense);
  }

  // delete expense

  void deleteExpense(ExpenseItem expense){
    overallExpenseList.remove(expense);


  //get weekday (mon, tues) from a date object


  // get the date for the start of the week (sunday)

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



}