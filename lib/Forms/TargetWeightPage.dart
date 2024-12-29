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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int targetWeight = UserData().targetWeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: height * 0.03),
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
              SizedBox(height: height * 0.04),
              Center(
                child: WeightPicker(
                  initialWeight: targetWeight,
                  onWeightChanged: (weight) {
                    UserData().targetWeight = weight; // Update target weight
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: GestureDetector(
                  onTap: () => _calculateRecommendedWeight(context),
                  child: Container(
                    width: width * 0.45,
                    height: height * 0.07,
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
                        width: width * 0.45,
                        height: height * 0.07,
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
                    SizedBox(height: height * 0.02),
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
                    SizedBox(height: height * 0.03),
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
    double height = MediaQuery.of(context).size.height;

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
        SizedBox(height: height * 0.03),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: height * 0.1,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: height * 0.4,
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
