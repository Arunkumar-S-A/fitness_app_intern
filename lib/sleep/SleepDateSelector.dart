import 'package:flutter/material.dart';

class SleepDateSelector extends StatelessWidget {
  final String? displayDate;
  final VoidCallback onPreviousDay;
  final VoidCallback onNextDay;
  final VoidCallback onCalendarTap;

  const SleepDateSelector({
    super.key,
    this.displayDate,
    required this.onPreviousDay,
    required this.onNextDay,
    required this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: const Color(0xFF787878),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: onPreviousDay,
                ),
                Text(displayDate ?? ''),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: onNextDay,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onCalendarTap,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xFF787878),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }
}
