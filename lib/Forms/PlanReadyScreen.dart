import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'UserData.dart'; // Import the UserData singleton
import '../BottomNavigation.dart';

class PlanReadyScreen extends StatefulWidget {
  const PlanReadyScreen({super.key});

  @override
  State<PlanReadyScreen> createState() => _PlanReadyScreenState();
}

class FitnessProfile {
  int age;
  double height;
  String gender;
  int workoutsPerWeek;
  String workoutIntensity;

  FitnessProfile({
    required this.age,
    required this.height,
    required this.gender,
    required this.workoutsPerWeek,
    required this.workoutIntensity,
  });
}

class _PlanReadyScreenState extends State<PlanReadyScreen> {
  DateTime targetDate = UserData().targetDate;
  double currentWeight = UserData().currentWeight.toDouble();
  double targetWeight = UserData().targetWeight.toDouble();
  double weeklyLossGoal = 0.5;
  double bmr = 0;
  double tdee = 0;
  double calorieDeficit = 500;
  late FitnessProfile profile;
  Map<String, double> macros = {
    'protein': 0,
    'carbs': 0,
    'fats': 0,
  };

  final Map<String, double> caloriesPerWorkout = {
    'light': 200,
    'moderate': 300,
    'intense': 450,
    'very intense': 600,
  };

  @override
  void initState() {
    super.initState();
    profile = FitnessProfile(
      age: UserData().age,
      height: UserData().currentHeight,
      gender: UserData().gender,
      workoutsPerWeek: UserData().workoutsPerWeek,
      workoutIntensity: UserData().workoutIntensity,
    );
    _calculateAll();
  }

  void _calculateAll() {
    _calculateBMR();
    _calculateTDEE();
    _calculateMacros();
    UserData().calorieBudget = tdee - calorieDeficit; // Store calorie budget
    UserData().targetDate = targetDate; // Store target date
  }

  void _calculateBMR() {
    // Mifflin-St Jeor Equation
    if (profile.gender == 'male') {
      bmr = (10 * currentWeight) +
          (6.25 * profile.height) -
          (5 * profile.age) +
          5;
    } else {
      bmr = (10 * currentWeight) +
          (6.25 * profile.height) -
          (5 * profile.age) -
          161;
    }
  }

  void _calculateTDEE() {
    // Activity Multiplier
    double activityMultiplier;
    switch (UserData().activityLevel) {
      case 'Sedentary':
        activityMultiplier = 1.2;
        break;
      case 'Light Active':
        activityMultiplier = 1.375;
        break;
      case 'Moderately Active':
        activityMultiplier = 1.55;
        break;
      case 'Very Active':
        activityMultiplier = 1.725;
        break;
      case 'Extra Active':
        activityMultiplier = 1.9;
        break;
      default:
        activityMultiplier = 1.375;
    }

    // Base TDEE
    tdee = bmr * activityMultiplier;

    // Add workout calories
    double workoutCalories =
        caloriesPerWorkout[profile.workoutIntensity] ?? 300;
    tdee += (workoutCalories * profile.workoutsPerWeek) / 7;

    // Calculate deficit
    calorieDeficit = (weeklyLossGoal * 7700) / 7; // 7700 calories = 1kg of fat
  }

  void _calculateMacros() {
    double targetCalories = tdee - calorieDeficit;

    // Protein: 2g per kg of target body weight
    double proteinGrams = targetWeight * 2;

    // Fat: 25% of total calories
    double fatGrams = (targetCalories * 0.25) / 9;

    // Remaining calories for carbs
    double remainingCalories =
        targetCalories - (proteinGrams * 4) - (fatGrams * 9);
    double carbGrams = remainingCalories / 4;

    setState(() {
      macros = {
        'protein': proteinGrams,
        'carbs': carbGrams,
        'fats': fatGrams,
      };
    });
  }

  void _updateWeeklyLossGoal() {
    final weeks = targetDate.difference(DateTime.now()).inDays / 7;
    weeklyLossGoal = (currentWeight - targetWeight) / weeks;
    _calculateAll();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: targetDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1B1464),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != targetDate) {
      setState(() {
        targetDate = picked;
        _updateWeeklyLossGoal();
      });
    }
  }

  void _selectWeightLossGoal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Weight Loss Goal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildGoalTile('Steady', 0.5, 'Recommended for sustainable loss'),
              _buildGoalTile('Moderate', 0.75, 'Balanced approach'),
              _buildGoalTile('Aggressive', 1.0, 'Maximum recommended rate'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGoalTile(String title, double goal, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${goal.toStringAsFixed(1)} kg/week\n$subtitle'),
      onTap: () {
        setState(() {
          weeklyLossGoal = goal;
          int daysNeeded = ((currentWeight - targetWeight) / goal * 7).round();
          targetDate = DateTime.now().add(Duration(days: daysNeeded));
          _calculateAll();
        });
        Navigator.pop(context);
      },
    );
  }

  void _showMacroDetails() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Daily Nutrition Targets'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMacroRow('Protein', macros['protein']!, 4),
              _buildMacroRow('Carbs', macros['carbs']!, 4),
              _buildMacroRow('Fats', macros['fats']!, 9),
              const Divider(),
              Text(
                'Total: ${(tdee - calorieDeficit).toStringAsFixed(0)} calories',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMacroRow(String macro, double grams, int calories) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(macro),
          Text(
              '${grams.toStringAsFixed(0)}g (${(grams * calories).toStringAsFixed(0)} cal)'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, size: 24),
              ),
              SizedBox(height: height * 0.1),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your Plan is Ready!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: width * 0.09,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF08244B),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    GestureDetector(
                      onTap: _showMacroDetails,
                      child: Column(
                        children: [
                          Text(
                            'Daily Food Calorie Budget',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width * 0.04,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            '${(tdee - calorieDeficit).toStringAsFixed(0)} kcal',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF08244B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildWeightColumn('Now', currentWeight),
                  SizedBox(width: width * 0.15),
                  _buildWeightColumn(
                    DateFormat('MMM dd').format(targetDate),
                    targetWeight,
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Center(
                child: Column(
                  children: [
                    _buildEditableRow(
                      'Lose ${weeklyLossGoal.toStringAsFixed(1)} kg/week',
                      () => _selectWeightLossGoal(context),
                    ),
                    SizedBox(height: height * 0.01),
                    _buildEditableRow(
                      'Target ${DateFormat('dd-MMM-yyyy').format(targetDate)}',
                      () => _selectDate(context),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Implement navigation to the next page or action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigation()),
                    );
                  },
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Let's go",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightColumn(String label, double weight) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              weight.toStringAsFixed(0),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'kg',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEditableRow(String text, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 4, height: 40),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.edit,
            size: 20,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
