import 'package:flutter/material.dart';
import 'workout/WorkoutHeader.dart';
import 'workout/WorkoutCard.dart';
import 'WorkoutMenu.dart'; // Import the new page

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  void _navigateToWorkoutMenu(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutMenu(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            WorkoutHeader(
              title: 'Track Your Workout',
              subtitle: 'Stay Fit',
              onNotificationTap: () {},
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Upper Body Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/upperbodyw.png',
                      title: 'Upper Body Workouts',
                      calories: '221/367 kcal',
                      exercises: 5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Full Body Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/fullbodyw.png',
                      title: 'Full Body Workouts',
                      calories: '220/650 kcal',
                      exercises: 7,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Lower Body Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/lowerbodyw.png',
                      title: 'Lower Body Workouts',
                      calories: '235/320 kcal',
                      exercises: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Arms Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/armw.png',
                      title: 'Arms Workouts',
                      calories: '75/240 kcal',
                      exercises: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _navigateToWorkoutMenu(
                        context, 'Cardio-based Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/cardiow.png',
                      title: 'Cardio-based Workouts',
                      calories: '123/250 kcal',
                      exercises: 5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Shoulder Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/shoulderw.png',
                      title: 'Shoulder Workouts',
                      calories: '200/350 kcal',
                      exercises: 4,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Back Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/backw.png',
                      title: 'Back Workouts',
                      calories: '200/350 kcal',
                      exercises: 4,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _navigateToWorkoutMenu(context, 'Core Workouts'),
                    child: const WorkoutCard(
                      image: 'assets/images/corew.png',
                      title: 'Core Workouts',
                      calories: '125/250 kcal',
                      exercises: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
