import 'ActivityLevelScreen.dart';
import 'package:flutter/material.dart';
import 'UserData.dart'; // Import the UserData singleton

class TargetWeightPage extends StatelessWidget {
  const TargetWeightPage({super.key});

  void _calculateRecommendedWeight(BuildContext context) {
    int currentWeight = UserData().currentWeight;
    double currentHeight = UserData().currentHeight;

    // Calculate BMI
    double heightInMeters = currentHeight / 100;
    double bmi = currentWeight / (heightInMeters * heightInMeters);

    // Recommend a target weight based on a healthy BMI range (18.5 - 24.9)
    double recommendedWeight = 22 * (heightInMeters * heightInMeters);

    // Show a dialog with the recommended weight
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Recommended Weight'),
        content: Text(
            'Based on your height, a healthy weight is around ${recommendedWeight.round()} kg.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _onNext(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ActivityLevelScreen()));
  }

  @override
  Widget build(BuildContext context) {
    int targetWeight = UserData().targetWeight;
    double currentHeight = UserData().currentHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Set your target weight",
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF08244B),
                    letterSpacing: -0.4,
                    height: 0.95,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: WeightPicker(
                  initialWeight: targetWeight,
                  onWeightChanged: (weight) {
                    UserData().targetWeight = weight; // Update target weight
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () => _calculateRecommendedWeight(context),
                  child: Container(
                    width: 176,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Recommend',
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
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _onNext(context),
                      child: Container(
                        width: 176,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        7,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 5
                                ? Colors.black
                                : Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeightPicker extends StatefulWidget {
  final int initialWeight;
  final ValueChanged<int> onWeightChanged;

  const WeightPicker({
    super.key,
    required this.initialWeight,
    required this.onWeightChanged,
  });

  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late int _currentWeight;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _currentWeight = widget.initialWeight;
    _scrollController = FixedExtentScrollController(
      initialItem: _currentWeight - 20, // Adjust initial position
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$_currentWeight kg',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 75,
            fontWeight: FontWeight.w400,
            color: Color(0xFF111111),
          ),
        ),
        const SizedBox(height: 24),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _currentWeight = index + 20;
                  });
                  widget.onWeightChanged(_currentWeight);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final weight = index + 20;
                    return Center(
                      child: Text(
                        weight.toString(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: _currentWeight == weight
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    );
                  },
                  childCount: 181, // Range from 20 to 200
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
