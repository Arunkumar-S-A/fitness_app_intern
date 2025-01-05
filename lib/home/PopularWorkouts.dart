/* lib/home/PopularWorkouts.dart */
import 'package:flutter/material.dart';

class PopularWorkouts extends StatelessWidget {
  final List<WorkoutCard> workouts;
  final String title;

  const PopularWorkouts({
    super.key,
    this.workouts = const [
      WorkoutCard(
        image: 'assets/images/hiit.png',
        title: 'HIIT Weight Training for Beginners',
        rating: 4.9,
      ),
      WorkoutCard(
        image: 'assets/images/fullbody.png',
        title: 'Full Body Workout',
        rating: 4.8,
      ),
      WorkoutCard(
        image: 'assets/images/cardio.png',
        title: 'Cardio for Weight Maintenance',
        rating: 4.7,
      ),
      WorkoutCard(
        image: 'assets/images/strength.png',
        title: 'Strength Training',
        rating: 4.7,
      ),
    ],
    this.title = 'Most popular workouts',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.04),
        SizedBox(
          height: screenWidth * 0.45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index != workouts.length - 1 ? screenWidth * 0.04 : 0,
                ),
                child: workouts[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;

  const WorkoutCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.7,
      height: screenWidth * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: screenWidth * 0.04,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
