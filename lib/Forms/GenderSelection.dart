import 'package:flutter/material.dart';
import 'WeightPage.dart';
import 'UserData.dart'; // Import the UserData singleton

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;

  void _navigateToWeightPage() {
    if (selectedGender != null) {
      UserData().gender = selectedGender!; // Store gender in UserData
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WeightPage()),
      );
    } else {
      // Optionally show a message to select a gender
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a gender')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              // Back Arrow
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: height * 0.08),
              // Title
              const Center(
                child: Text(
                  "What's your gender?",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF08244B),
                    letterSpacing: -0.4,
                    height: 0.95,
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              // Male Option
              _buildGenderOption(
                'Male',
                'assets/images/male.png', // Local image path
                'male',
              ),
              SizedBox(height: height * 0.02),
              // Female Option
              _buildGenderOption(
                'Female',
                'assets/images/female.png', // Local image path
                'female',
              ),
              const Spacer(),
              // Next Button and Progress Bar
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _navigateToWeightPage,
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
                            color: index == 1
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

  Widget _buildGenderOption(
      String label, String imagePath, String genderValue) {
    bool isSelected = selectedGender == genderValue;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = genderValue;
        });
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
}
