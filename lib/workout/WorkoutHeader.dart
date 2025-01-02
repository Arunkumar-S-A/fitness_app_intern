import 'package:flutter/material.dart';

class WorkoutHeader extends StatelessWidget {
  final String title;

  const WorkoutHeader({
    super.key,
    this.title = 'Workouts',
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: width * 0.25,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: width * 0.08,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF111111),
          ),
        ),
      ),
    );
  }
}
