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
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                const Text(
                  "Let's Get to Know You",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 30,
                    color: Color(0xFF111111),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
            SizedBox(height: height * 0.02),
            const Text(
              'We use this information to create a workout and\nnutrition plan tailored just for you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xFF787878),
                height: 2,
              ),
            ),
            SizedBox(height: height * 0.03),
            const Text(
              'How young are you?',
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 40,
                color: Color(0xFF08244B),
                letterSpacing: -0.4,
              ),
            ),
            SizedBox(height: height * 0.05),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.25,
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
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                              color: Color(0xFF111111),
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
            GestureDetector(
              onTap: _navigateToGenderSelection,
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
                    color: index == 0
                        ? Colors.black
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
