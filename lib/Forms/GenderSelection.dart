import 'package:flutter/material.dart';
import 'WeightPage.dart';

class GenderSelection extends StatefulWidget {
  final Function(String)? onGenderSelected;

  const GenderSelection({
    super.key,
    this.onGenderSelected,
  });

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;

  void _navigateToWeightPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WeightPage()),
    );
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
              // Back Arrow
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 30),
              // Title
              const Center(
                child: Text(
                  "What's your gender?",
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
              // Male Option
              _buildGenderOption(
                'Male',
                'assets/images/male.png', // Local image path
                'male',
              ),
              const SizedBox(height: 20),
              // Female Option
              _buildGenderOption(
                'Female',
                'assets/images/female.png', // Local image path
                'female',
              ),
              const Spacer(),
              // Skip and Next Buttons
              Center(
                child: Column(
                  children: [
                    _buildButton('Skip', _navigateToWeightPage),
                    const SizedBox(height: 15),
                    _buildButton('Next', _navigateToWeightPage),
                    const SizedBox(height: 20),
                    // Progress Bar
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
                            color: index == 1
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

  Widget _buildGenderOption(
      String label, String imagePath, String genderValue) {
    bool isSelected = selectedGender == genderValue;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = genderValue;
        });
        widget.onGenderSelected?.call(genderValue);
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDFDFDF) : const Color(0xDDDFDFDF),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: const Color(0xFF111111), width: 1),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Row(
                children: [
                  Icon(
                    genderValue == 'male' ? Icons.male : Icons.female,
                    size: 24,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF111111),
                      letterSpacing: -0.048,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 176,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
