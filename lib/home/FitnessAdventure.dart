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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: CircularPercentIndicator(
              radius: width * 0.25,
              lineWidth: width * 0.035,
              percent: progressPercentage,
              center: Text(
                '${(progressPercentage * 100).toInt()}%',
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              progressColor: Colors.orangeAccent,
              backgroundColor: Colors.grey[300]!,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(
                  Icons.check_circle, 'Completed', workoutCompleteCount, width),
              _buildStat(
                  Icons.timelapse, 'In Progress', inProgressCount, width),
              _buildStat(Icons.timer, 'Best (min)', personalBestMinutes, width),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String label, int value, double width) {
    return Column(
      children: [
        Icon(
          icon,
          size: width * 0.08,
          color: Colors.blue,
        ),
        SizedBox(height: width * 0.02),
        Text(
          '$value',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.03,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
