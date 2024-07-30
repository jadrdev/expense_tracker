import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpensiveTitle extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  final void Function(BuildContext)? onEdit;
   final void Function(BuildContext)? onDelete;

  const ExpensiveTitle(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.onEdit,
      required this.onDelete
      });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
       motion: const StretchMotion(),
       children: [
        SlidableAction(
          onPressed: onEdit,
          icon: Icons.settings
          ),
           SlidableAction(
          onPressed: onDelete,
          icon: Icons.delete
          )
       ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text('${dateTime.day}/${dateTime.month}/${dateTime.year}',
        ),
        trailing: Text('$amount€'),
      ),
    );
  }
}
