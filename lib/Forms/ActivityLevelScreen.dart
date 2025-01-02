import 'package:flutter/material.dart';
import 'UserData.dart'; // Import the UserData singleton
import 'PlanReadyScreen.dart';

class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({super.key});

  @override
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  final List<Map<String, String>> activityLevels = [
    {
      'title': 'Sedentary',
      'description': 'Little or no exercise',
    },
    {
      'title': 'Light Active',
      'description': '1 - 3 \ndays/week',
    },
    {
      'title': 'Moderately Active',
      'description': '3 - 5 \ndays/week',
    },
    {
      'title': 'Very Active',
      'description': '6 - 7 \ndays/week',
    },
    {
      'title': 'Extra Active',
      'description': 'Very intensive daily',
    },
  ];

  int selectedIndex = -1;
  int currentPage = 0;
  final int totalPages = 7;

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
              const Center(
                child: Text(
                  'Activity Level',
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 40,
                      color: Color(0xFF08244B),
                      height: 1.2,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: ListView.builder(
                  itemCount: activityLevels.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            UserData().activityLevel =
                                activityLevels[index]['title']!;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isSelected ? Colors.black : Colors.grey,
                                width: 0.5),
                            color: isSelected
                                ? const Color(0xFFD9D9D9)
                                : Colors.white, // Use D9D9D9 when selected
                            boxShadow: [
                              BoxShadow(
                                color: isSelected
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors
                                        .transparent, // Remove shadow for not selected
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: isSelected
                                      ? const Color(0xFFD9D9D9)
                                      : Colors
                                          .white, // Use D9D9D9 when selected
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.monitor_heart_outlined,
                                        color: Color(0xFF1B1464),
                                        size: 25,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        activityLevels[index]['title']!,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: isSelected
                                              ? Colors.black
                                              : const Color(0xFF1B1464),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: height * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      activityLevels[index]['description']!,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (selectedIndex == -1) {
                      // Show a message if no activity level is selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select an activity level.'),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlanReadyScreen()),
                      );
                    }
                  },
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
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    totalPages,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 6
                            ? Colors.black
                            : Colors.grey.withOpacity(0.3),
                      ),
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
