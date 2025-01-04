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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index != workouts.length - 1 ? 16.0 : 0,
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
    return Container(
      width: 291,
      height: 149,
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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
