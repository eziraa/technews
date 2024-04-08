import 'package:flutter/material.dart';

class CustomDateDisplay {
  static List<Widget> build(BuildContext context) {
    List<Widget> dateTiles = [];

    // Today's date
    dateTiles.add(
      DateTile(
        date: DateTime.now(),
        label: 'Today',
      ),
    );

    // Yesterday's date
    dateTiles.add(
      DateTile(
        date: DateTime.now().subtract(const Duration(days: 1)),
        label: 'Yesterday',
      ),
    );

    // Dates from 2 days ago to 6 days ago
    for (int i = 2; i <= 6; i++) {
      dateTiles.add(
        DateTile(
          date: DateTime.now().subtract(Duration(days: i)),
        ),
      );
    }

    return dateTiles;
  }
}

class DateTile extends StatelessWidget {
  final DateTime date;
  final String? label;

  DateTile({required this.date, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '${label ?? ''}${label != null ? ', ' : ''}${_formatDate(date)}',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  String _formatDate(DateTime date) {
    if (label == 'Today') {
      return _formatMonthAndDay(date);
    } else if (label == 'Yesterday') {
      return _formatMonthAndDay(date);
    } else {
      return _formatFullDate(date);
    }
  }

  String _formatMonthAndDay(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}';
  }

  String _formatFullDate(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
