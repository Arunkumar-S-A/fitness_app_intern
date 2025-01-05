/* lib/home/ProgressSection.dart */
import 'package:flutter/material.dart';

class ProgressSection extends StatelessWidget {
  final int exercisesLeft;
  final int caloriesBurned;
  final int completedGymSessions;
  final int totalGymSessions;

  const ProgressSection({
    super.key,
    this.exercisesLeft = 8,
    this.caloriesBurned = 567,
    this.completedGymSessions = 14,
    this.totalGymSessions = 20,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.09),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: screenWidth * 0.03,
            offset: Offset(0, screenWidth * 0.01),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Progress',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressDetail(
                icon: Icons.fitness_center,
                label: 'Exercises Left',
                value: '$exercisesLeft',
                iconColor: Colors.blue,
                screenWidth: screenWidth,
              ),
              _buildProgressDetail(
                icon: Icons.local_fire_department,
                label: 'Calories Burned',
                value: '$caloriesBurned kcal',
                iconColor: Colors.red,
                screenWidth: screenWidth,
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.04),
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            child: LinearProgressIndicator(
              value: completedGymSessions / totalGymSessions,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
              minHeight: screenWidth * 0.025,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$completedGymSessions/$totalGymSessions Gym Sessions',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenWidth * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(screenWidth * 0.09),
                ),
                child: Text(
                  'In Progress',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressDetail({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
    required double screenWidth,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          size: screenWidth * 0.08,
          color: iconColor,
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(
          value,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
