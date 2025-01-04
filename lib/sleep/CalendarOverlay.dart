import 'package:flutter/material.dart';

class CalendarOverlay extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final VoidCallback onCancel;

  const CalendarOverlay({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CalendarDatePicker(
                    initialDate: selectedDate.isAfter(DateTime(2025, 1, 1))
                        ? DateTime(2025, 1, 1)
                        : selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025, 1, 1),
                    onDateChanged: onDateChanged,
                  ),
                  OverflowBar(
                    children: [
                      TextButton(
                        onPressed: onCancel,
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: onCancel,
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
