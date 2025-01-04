import 'package:flutter/material.dart';

class MetricTile extends StatelessWidget {
  final String title;
  final String value;

  const MetricTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF787878), // Border color
          width: 1, // Border width
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black, // Change the font color if needed
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black, // Change the font color if needed
            ),
          )
        ],
      ),
    );
  }
}
