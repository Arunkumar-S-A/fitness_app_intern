/* lib/workoutsmenu/WorkoutSection.dart */
import 'dart:async';
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
    this.imageUrl = 'assets/images/burpees.png',
    this.repsAndRest = '12 reps   60s rest',
    this.description =
        'Start standing, squat down, jump into a plank, optionally do a push-up, jump back to squat, and finish with a jump upward',
    this.completedSets = const [false, false, false],
  });

  Future<Size> _getImageSize(String imageUrl) async {
    final Completer<Size> completer = Completer();
    final Image image = Image.asset(imageUrl);

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.05,
              color: const Color(0xFF787878),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          FutureBuilder<Size>(
            future: _getImageSize(imageUrl),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final aspectRatio =
                    snapshot.data!.width / snapshot.data!.height;
                return AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(height: screenWidth * 0.04),
          Center(
            child: Text(
              repsAndRest,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.04,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              description,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.035,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              return Container(
                width: screenWidth * 0.25,
                height: screenWidth * 0.09,
                decoration: BoxDecoration(
                  color: completedSets[index]
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Set ${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: screenWidth * 0.035,
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
