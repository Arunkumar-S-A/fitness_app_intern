import 'package:flutter/material.dart';
import 'GenderSelection.dart';

class AgeSelectorScreen extends StatefulWidget {
  final Function(int)? onAgeSelected;

  const AgeSelectorScreen({
    super.key,
    this.onAgeSelected,
  });

  @override
  _AgeSelectorScreenState createState() => _AgeSelectorScreenState();
}

class _AgeSelectorScreenState extends State<AgeSelectorScreen> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 7);
  final List<int> ages = List.generate(67, (index) => index + 14);

  void _navigateToGenderSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GenderSelection()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
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
            const SizedBox(height: 16),
            const Text(
              'We use this information to create a workout and\nnutrition plan tailored just for you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color(0xFF787878),
                height: 2,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'How young are you?',
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 40,
                color: Color(0xFF08244B),
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 40),
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
                    itemExtent: 80,
                    perspective: 0.005,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      if (widget.onAgeSelected != null) {
                        widget.onAgeSelected!(ages[index]);
                      }
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
                    color: index == 0
                        ? Colors.black
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
