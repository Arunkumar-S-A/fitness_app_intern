/* lib/HomeScreen.dart */
import 'package:flutter/material.dart';
import 'home/HomeHeader.dart';
import 'home/ProgressSection.dart';
import 'home/NavigationTabs.dart';
import 'home/CustomSearchBar.dart';
import 'home/PopularWorkouts.dart';
import 'home/FitnessAdventure.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              SizedBox(height: screenWidth * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: const ProgressSection(),
              ),
              SizedBox(height: screenWidth * 0.04),
              NavigationTabs(
                onTabChanged: (index) {},
              ),
              SizedBox(height: screenWidth * 0.04),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: const CustomSearchBar(),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              const PopularWorkouts(),
              SizedBox(height: screenWidth * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: const FitnessAdventure(),
              ),
              SizedBox(height: screenWidth * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
