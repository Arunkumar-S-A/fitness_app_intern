import 'package:flutter/material.dart';
import 'HeightPage.dart';
import 'UserData.dart'; // Import the UserData singleton

class WeightPage extends StatelessWidget {
  const WeightPage({super.key});

  void _onNext(BuildContext context) {
    // Navigate to HeightPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HeightPage()),
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
              SizedBox(height: height * 0.02),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: height * 0.03),
              Center(
                child: Text(
                  "What's your weight?",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: width * 0.09,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF08244B),
                    letterSpacing: -0.4,
                    height: 0.95,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              // Weight picker component
              Center(
                child: WeightPicker(
                  initialWeight: UserData().currentWeight,
                  onWeightChanged: (weight) {
                    UserData().currentWeight =
                        weight; // Store weight in UserData
                  },
                ),
              ),
              const Spacer(),
              // Next button and progress bar
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _onNext(context),
                      child: Container(
                        width: width * 0.4,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width * 0.04,
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
                          width: width * 0.02,
                          height: width * 0.02,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 2
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(
          '$_currentWeight kg',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: width * 0.18,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF111111),
          ),
        ),
        SizedBox(height: height * 0.03),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: height * 0.1,
              width: width * 0.25,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: height * 0.4,
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: height * 0.07,
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
                          fontSize: width * 0.065,
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
