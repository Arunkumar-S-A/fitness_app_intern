import 'package:flutter/material.dart';
import 'WorkoutsMenuHeader.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WorkoutsMenuHeader(
                title: 'Achievement',
                onBackPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: width * 0.15,
                      color: Colors.black,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Workout Complete!',
                      style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF08244B),
                        fontFamily: 'Oswald',
                      ),
                    ),
                    Text(
                      'Great job crushing your Full Body Workout',
                      style: TextStyle(
                        color: Color(0XFF111111),
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMetricCard(
                          icon: Icons.timer,
                          value: '30:00',
                          label: 'Duration',
                          width: width,
                        ),
                        _buildMetricCard(
                          icon: Icons.local_fire_department,
                          value: '350',
                          label: 'Calories',
                          width: width,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    _buildAchievementsSection(width),
                    SizedBox(height: height * 0.03),
                    _buildExerciseDetails(width),
                    SizedBox(height: height * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon:
                                const Icon(Icons.history, color: Colors.black),
                            label: Text(
                              'Share Workout',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontFamily: 'Poppins',
                                fontSize: width * 0.04,
                              ),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD9D9D9),
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              minimumSize: Size(width * 0.35, height * 0.07),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Color(0xFF787878),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon:
                                const Icon(Icons.history, color: Colors.black),
                            label: Text(
                              'Save to History',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontFamily: 'Poppins',
                                fontSize: width * 0.04,
                              ),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD9D9D9),
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              minimumSize: Size(width * 0.35, height * 0.07),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Color(0xFF787878),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String value,
    required String label,
    required double width,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: width * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF787878)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: width * 0.06),
          SizedBox(height: width * 0.02),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.grey[600],
              fontSize: width * 0.035,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.05,
          ),
        ),
        SizedBox(height: width * 0.03),
        _buildAchievementItem('New Personal Best: Burpees - 185 lbs', width),
        _buildAchievementItem('5 Workout Streak', width),
        _buildAchievementItem('All Sets Completed', width),
      ],
    );
  }

  Widget _buildAchievementItem(String text, double width) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: width * 0.03, horizontal: width * 0.04),
      margin: EdgeInsets.only(bottom: width * 0.02),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF787878)),
      ),
      child: Row(
        children: [
          Icon(Icons.emoji_events, color: Colors.black, size: width * 0.06),
          SizedBox(width: width * 0.03),
          Text(
            text,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseDetails(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exercise Details',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: width * 0.03),
        _buildExerciseSet('Burpees', width),
        SizedBox(height: width * 0.04),
        _buildExerciseSet('Push-ups', width),
      ],
    );
  }

  Widget _buildExerciseSet(String exerciseName, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exerciseName,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: width * 0.02),
        Row(
          children: [
            _buildSetCard('Set 1', '12 reps', width),
            SizedBox(width: width * 0.02),
            _buildSetCard('Set 2', '12 reps', width),
            SizedBox(width: width * 0.02),
            _buildSetCard('Set 3', '12 reps', width),
          ],
        ),
      ],
    );
  }

  Widget _buildSetCard(String setLabel, String reps, double width) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF787878)),
        ),
        child: Column(
          children: [
            Text(
              setLabel,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.grey[600],
                fontSize: width * 0.035,
              ),
            ),
            SizedBox(height: width * 0.01),
            Text(
              reps,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
