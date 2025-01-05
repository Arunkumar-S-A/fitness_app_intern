/* lib/home/FitnessAdventure.dart */
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FitnessAdventure extends StatelessWidget {
  final String title;
  final int workoutCompleteCount;
  final double progressPercentage;
  final int inProgressCount;
  final int personalBestMinutes;

  const FitnessAdventure({
    super.key,
    this.title = 'Your Fitness Adventure',
    this.workoutCompleteCount = 12,
    this.progressPercentage = 0.7,
    this.inProgressCount = 3,
    this.personalBestMinutes = 50,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
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
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Center(
            child: CircularPercentIndicator(
              radius: screenWidth * 0.25,
              lineWidth: screenWidth * 0.035,
              percent: progressPercentage,
              center: Text(
                '${(progressPercentage * 100).toInt()}%',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              progressColor: Colors.orangeAccent,
              backgroundColor: Colors.grey[300]!,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(Icons.check_circle, 'Completed', workoutCompleteCount,
                  screenWidth),
              _buildStat(
                  Icons.timelapse, 'In Progress', inProgressCount, screenWidth),
              _buildStat(
                  Icons.timer, 'Best (min)', personalBestMinutes, screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
      IconData icon, String label, int value, double screenWidth) {
    return Column(
      children: [
        Icon(
          icon,
          size: screenWidth * 0.08,
          color: Colors.blue,
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          '$value',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
