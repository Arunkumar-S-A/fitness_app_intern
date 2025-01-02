import 'package:flutter/material.dart';
import 'nutrition/NutritionHeader.dart';
import 'nutrition/DateSelector.dart';
import 'nutrition/NutritionSummary.dart';
import 'nutrition/MealList.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NutritionHeader(),
              SizedBox(height: height * 0.02),
              DateSelector(
                onDateSelected: (index) {
                  // Handle date selection
                },
              ),
              SizedBox(height: height * 0.02),
              const NutritionSummary(),
              SizedBox(height: height * 0.02),
              const MealList(),
            ],
          ),
        ),
      ),
    );
  }
}
