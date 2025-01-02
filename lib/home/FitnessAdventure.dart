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
    return Container(
      padding: const EdgeInsets.all(16.0),
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
              fontFamily: 'Oswald',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 10.0,
              percent: progressPercentage,
              center: Text(
                '${(progressPercentage * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              progressColor: Colors.orangeAccent,
              backgroundColor: Colors.grey[300]!,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(Icons.check_circle, 'Completed', workoutCompleteCount),
              _buildStat(Icons.timelapse, 'In Progress', inProgressCount),
              _buildStat(Icons.timer, 'Best (min)', personalBestMinutes),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String label, int value) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.blue,
        ),
        const SizedBox(height: 8),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
