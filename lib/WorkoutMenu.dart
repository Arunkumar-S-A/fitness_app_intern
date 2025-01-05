/* lib/WorkoutMenu.dart */
import 'package:flutter/material.dart';
import 'workoutsmenu/WorkoutsMenuHeader.dart';
import 'workoutsmenu/WorkoutSection.dart';
import 'workoutsmenu/CompleteWorkoutButton.dart';
import 'workoutsmenu/AchievementPage.dart';

class WorkoutMenu extends StatelessWidget {
  const WorkoutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WorkoutsMenuHeader(),
              const WorkoutSection(
                title: 'Jumping Jacks',
                imageUrl: 'assets/images/jumping_jacks.png',
                repsAndRest: '20 reps   30s rest',
                description:
                    'Jumping jacks are a full-body workout that can target major muscle groups, strengthen bones, and improve cardiovascular fitness and heart health.',
                completedSets: [true, true, false],
              ),
              const WorkoutSection(
                title: 'Burpees',
                imageUrl: 'assets/images/burpees.png',
                repsAndRest: '10 reps   60s rest',
                description:
                    'Burpees are a full-body exercise that can improve your cardiovascular fitness and strength.',
                completedSets: [false, false, false],
              ),
              SizedBox(height: screenWidth * 0.06),
              CompleteWorkoutButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AchievementPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenWidth * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
