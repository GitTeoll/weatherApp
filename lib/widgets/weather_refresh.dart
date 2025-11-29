import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDateTimeRow extends StatelessWidget {
  final VoidCallback onRefresh;

  const CurrentDateTimeRow({super.key, required this.onRefresh});

  // 현재 날짜 포맷
  String _formattedDate() {
    final now = DateTime.now();
    return DateFormat('EEEE, d MMM h:mm a').format(now);
    // 예: Thursday, 20 Apr 8:30 AM
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formattedDate(),
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onRefresh,
          child: Icon(Icons.refresh, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
