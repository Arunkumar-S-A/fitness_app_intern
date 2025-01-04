import 'package:flutter/material.dart';
import 'AchievementPage.dart';

class CompleteWorkoutButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;

  const CompleteWorkoutButton({
    super.key,
    this.onPressed,
    this.text = 'Complete Workout',
    this.width = 199,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(27.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(27.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: Icon(
                  Icons.check_circle_sharp, // Example icon
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF111111),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
