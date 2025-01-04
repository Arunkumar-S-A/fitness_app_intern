import 'package:flutter/material.dart';
import 'workoutsmenu/WorkoutsMenuHeader.dart';
import 'workoutsmenu/WorkoutSection.dart';
import 'workoutsmenu/CompleteWorkoutButton.dart';
import 'workoutsmenu/AchievementPage.dart'; // Import the AchievementsPage

class WorkoutMenu extends StatelessWidget {
  const WorkoutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WorkoutsMenuHeader(),
              const WorkoutSection(
                title: 'Push-Ups',
                imageUrl:
                    'https://dashboard.codeparrot.ai/api/assets/Z3gcegT5FckTQ390',
                repsAndRest: '15 reps   60s rest',
                description:
                    'Perform push-ups with proper form to engage your upper body muscles.',
                completedSets: [true, false, false],
              ),
              const WorkoutSection(
                title: 'Pull-Ups',
                imageUrl:
                    'https://dashboard.codeparrot.ai/api/assets/Z3gcpgT5FckTQ392',
                repsAndRest: '10 reps   90s rest',
                description:
                    'Use a pull-up bar to strengthen your back and biceps.',
                completedSets: [false, false, false],
              ),
              const WorkoutSection(
                title: 'Bench Press',
                imageUrl:
                    'https://dashboard.codeparrot.ai/api/assets/Z3gcegT5FckTQ390',
                repsAndRest: '12 reps   60s rest',
                description:
                    'Perform bench presses to target your chest muscles.',
                completedSets: [false, false, false],
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
