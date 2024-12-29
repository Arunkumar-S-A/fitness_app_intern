import 'package:flutter/material.dart';
import 'home/HomeHeader.dart';
import 'home/ProgressSection.dart';
import 'home/NavigationTabs.dart';
import 'home/CustomSearchBar.dart';
import 'home/PopularWorkouts.dart';
import 'home/FitnessAdventure.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                name: 'Mary',
                imagePath: 'assets/images/profile.png',
                onNotificationTap: () {},
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ProgressSection(),
              ),
              const SizedBox(height: 16),
              NavigationTabs(
                onTabChanged: (index) {},
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomSearchBar(),
              ),
              const SizedBox(height: 16),
              const PopularWorkouts(),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: FitnessAdventure(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
