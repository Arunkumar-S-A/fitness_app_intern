/* lib/Forms/WeightPage.dart */
import 'package:flutter/material.dart';
import 'HeightPage.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({super.key});

  void _onNext(BuildContext context) {
    // Navigate to DiseaseSelectionScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HeightPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  "What's your weight?",
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
              // Weight picker component
              Center(
                child: WeightPicker(
                  initialWeight: 73, // Set initial weight to 73
                  onWeightChanged: (weight) {
                    // Handle weight change
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Spacer(),
              // Next button and progress bar
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
                            color: index == 2
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
