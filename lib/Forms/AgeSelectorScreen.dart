import 'package:flutter/material.dart';
import 'GenderSelection.dart';
import 'UserData.dart'; // Import UserData

class AgeSelectorScreen extends StatefulWidget {
  const AgeSelectorScreen({super.key});

  @override
  _AgeSelectorScreenState createState() => _AgeSelectorScreenState();
}

class _AgeSelectorScreenState extends State<AgeSelectorScreen> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 7);
  final List<int> ages = List.generate(67, (index) => index + 14);
  int selectedAge = 21; // Default age

  void _navigateToGenderSelection() {
    // Store the selected age in UserData before navigating
    UserData().age = selectedAge;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GenderSelection()),
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
                  "Let's Get to Know You",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: width * 0.065,
                    color: const Color(0xFF111111),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Text(
                  'We use this information to create a workout and\nnutrition plan tailored just for you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: width * 0.03,
                    color: const Color(0xFF787878),
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Center(
                child: Text(
                  'How young are you?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: width * 0.09,
                    color: const Color(0xFF08244B),
                    letterSpacing: -0.4,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
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
                      itemExtent: height * 0.1,
                      perspective: 0.005,
                      diameterRatio: 2.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedAge = ages[index];
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final age = ages[index];
                          return Center(
                            child: Text(
                              age.toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: width * 0.08,
                                color: const Color(0xFF111111),
                              ),
                            ),
                          );
                        },
                        childCount: ages.length,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: _navigateToGenderSelection,
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
                      color: index == 0
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
      ),
    );
  }
}
