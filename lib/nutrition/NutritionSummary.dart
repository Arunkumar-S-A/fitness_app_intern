import 'package:flutter/material.dart';

class NutritionSummary extends StatelessWidget {
  final int consumedCalories;
  final int totalCalories;
  final int consumedProtein;
  final int totalProtein;
  final int consumedCarbs;
  final int totalCarbs;
  final int consumedFat;
  final int totalFat;

  const NutritionSummary({
    Key? key,
    this.consumedCalories = 1456,
    this.totalCalories = 2875,
    this.consumedProtein = 60,
    this.totalProtein = 85,
    this.consumedCarbs = 300,
    this.totalCarbs = 485,
    this.consumedFat = 60,
    this.totalFat = 85,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.95,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalorieInfo(
                calories: consumedCalories,
                label: 'Consumed',
                icon: Icons.local_fire_department,
                color: Colors.orange,
                width: width,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: width * 0.3, // Increased size
                    height: width * 0.3, // Increased size
                    child: CircularProgressIndicator(
                      value: consumedCalories / totalCalories,
                      strokeWidth: 15, // Increased stroke width
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  Text(
                    '${((consumedCalories / totalCalories) * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111111),
                    ),
                  ),
                ],
              ),
              _buildCalorieInfo(
                calories: totalCalories,
                label: 'Goal',
                icon: Icons.flag,
                color: Colors.blue,
                width: width,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNutrientInfo(
                name: 'Protein',
                consumed: consumedProtein,
                total: totalProtein,
                icon: Icons.fitness_center,
                color: Colors.purple,
                width: width,
              ),
              _buildNutrientInfo(
                name: 'Carbs',
                consumed: consumedCarbs,
                total: totalCarbs,
                icon: Icons.bakery_dining,
                color: Colors.brown,
                width: width,
              ),
              _buildNutrientInfo(
                name: 'Fat',
                consumed: consumedFat,
                total: totalFat,
                icon: Icons.fastfood,
                color: Colors.red,
                width: width,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieInfo({
    required int calories,
    required String label,
    required IconData icon,
    required Color color,
    required double width,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: width * 0.08),
        SizedBox(height: 8),
        Text(
          '$calories kcal',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111111),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.03,
            fontWeight: FontWeight.w400,
            color: Color(0xFF111111).withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildNutrientInfo({
    required String name,
    required int consumed,
    required int total,
    required IconData icon,
    required Color color,
    required double width,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: width * 0.08),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111111),
          ),
        ),
        Text(
          '$consumed/${total}g',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.03,
            fontWeight: FontWeight.w400,
            color: Color(0xFF111111).withOpacity(0.6),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: width * 0.2,
          height: 12,
          child: LinearProgressIndicator(
            value: consumed / total,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
