import 'package:flutter/material.dart';

class WorkoutSection extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String repsAndRest;
  final String description;
  final List<bool> completedSets;

  const WorkoutSection({
    super.key,
    this.title = 'Burpees',
    this.imageUrl =
        'https://dashboard.codeparrot.ai/api/assets/Z3gcegT5FckTQ390',
    this.repsAndRest = '12 reps   60s rest',
    this.description =
        'Start standing, squat down, jump into a plank, optionally do a push-up, jump back to squat, and finish with a jump upward',
    this.completedSets = const [false, false, false],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Color(0xFF787878),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              repsAndRest,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color(0xFF111111),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              description,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color(0xFF111111),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              return Container(
                width: 106,
                height: 36,
                decoration: BoxDecoration(
                  color: completedSets[index]
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Set ${index + 1}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
