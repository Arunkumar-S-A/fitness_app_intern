import 'package:flutter/material.dart';

class SleepHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onNotificationTap;

  const SleepHeader({
    super.key,
    this.title = 'Sleep Statistics',
    this.subtitle = 'Rest Well',
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.03),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF08244B),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onNotificationTap,
            child: Container(
              padding: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications,
                size: width * 0.08,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
