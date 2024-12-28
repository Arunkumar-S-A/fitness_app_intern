import 'package:flutter/material.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({super.key});

  void _onNext(BuildContext context) {
    // Implement navigation to the next page or action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  initialWeight: 60,
                  onWeightChanged: (weight) {
                    // Handle weight change
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Blue line and middle text
              Center(
                child: BlueLineWithText(),
              ),
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

  @override
  void initState() {
    super.initState();
    _currentWeight = widget.initialWeight;
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
        SizedBox(
          width: 408,
          height: 116,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 181, // Range from 20 to 200
            itemBuilder: (context, index) {
              int weight = index + 20; // Start from 20
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentWeight = weight;
                  });
                  widget.onWeightChanged(_currentWeight);
                },
                child: Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '$weight',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color:
                          _currentWeight == weight ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BlueLineWithText extends StatelessWidget {
  const BlueLineWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 4,
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        const Text(
          'Middle',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFF111111),
          ),
        ),
      ],
    );
  }
}
