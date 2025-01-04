import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final String title;
  final bool isBedTime;
  final VoidCallback onSelectTime;
  final String time;

  const TimePicker({
    super.key,
    required this.title,
    required this.isBedTime,
    required this.onSelectTime,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectTime,
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: [
                Text(time),
                const SizedBox(width: 8.0),
                const Icon(Icons.alarm, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
