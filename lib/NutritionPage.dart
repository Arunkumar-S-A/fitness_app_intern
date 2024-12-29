import 'package:flutter/material.dart';
import 'nutrition/NutritionHeader.dart';
import 'nutrition/DateSelector.dart';
import 'nutrition/NutritionSummary.dart';
import 'nutrition/MealList.dart';

class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NutritionHeader(),
              SizedBox(height: height * 0.02),
              DateSelector(
                onDateSelected: (index) {
                  // Handle date selection
                },
              ),
              SizedBox(height: height * 0.02),
              NutritionSummary(),
              SizedBox(height: height * 0.02),
              MealList(),
            ],
          ),
        ),
      ),
    );
  }
}
