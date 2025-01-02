import 'package:flutter/material.dart';
import 'workout/WorkoutHeader.dart';
import 'workout/WorkoutCard.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const WorkoutHeader(
            title: 'Workouts',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                WorkoutCard(
                  image: 'assets/images/upperbodyw.png',
                  title: 'Upper Body Workouts',
                  calories: '221/367 kcal',
                  exercises: 5,
                ),
                WorkoutCard(
                  image: 'assets/images/fullbodyw.png',
                  title: 'Full Body Workouts',
                  calories: '220/650 kcal',
                  exercises: 7,
                ),
                WorkoutCard(
                  image: 'assets/images/lowerbodyw.png',
                  title: 'Lower Body Workouts',
                  calories: '235/320 kcal',
                  exercises: 3,
                ),
                WorkoutCard(
                  image: 'assets/images/armw.png',
                  title: 'Arms Workouts',
                  calories: '75/240 kcal',
                  exercises: 3,
                ),
                WorkoutCard(
                  image: 'assets/images/cardiow.png',
                  title: 'Cardio-based Workouts',
                  calories: '123/250 kcal',
                  exercises: 5,
                ),
                WorkoutCard(
                  image: 'assets/images/shoulderw.png',
                  title: 'Shoulder Workouts',
                  calories: '200/350 kcal',
                  exercises: 4,
                ),
                WorkoutCard(
                  image: 'assets/images/backw.png',
                  title: 'Back Workouts',
                  calories: '200/350 kcal',
                  exercises: 4,
                ),
                WorkoutCard(
                  image: 'assets/images/corew.png',
                  title: 'Core Workouts',
                  calories: '125/250 kcal',
                  exercises: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
