import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListDivider extends StatelessWidget {
  final DateTime date;
  const ListDivider({Key? key, required this.date}) : super(key: key);

  String _buildText() {
    switch (DateTime.now().difference(date).inDays) {
      case 0:
        return "Today";
      case 1:
        return "Yesterday";
      default:
        return DateFormat('EEE, MMM dd').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      width: double.infinity,
      color: Colors.grey[400],
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _buildText(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
