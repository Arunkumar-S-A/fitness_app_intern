/* lib/workoutsmenu/CompleteWorkoutButton.dart */
import 'package:flutter/material.dart';

class CompleteWorkoutButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CompleteWorkoutButton({
    super.key,
    this.onPressed,
    this.text = 'Complete Workout',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.03, // Added vertical padding for height
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(screenWidth * 0.07),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(screenWidth * 0.08),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_sharp,
                size: screenWidth * 0.08,
                color: Colors.black,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF111111),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
