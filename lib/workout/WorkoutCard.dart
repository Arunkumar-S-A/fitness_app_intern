import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String image;
  final String title;
  final String calories;
  final int exercises;

  const WorkoutCard({
    super.key,
    required this.image,
    required this.title,
    required this.calories,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.15;
    double imageWidth = cardHeight * (232 / 155); // Maintain aspect ratio
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFD9D9D9),
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          // Image section
          Container(
            width: imageWidth,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      color: Color(0xFF08244B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height * 0.001),
                  Text(
                    calories,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: Color(0xFF111111),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No. of Exercises: $exercises',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: Color(0xFF111111),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
