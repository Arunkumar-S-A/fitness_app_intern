/* lib/FlashScreen.dart */
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.09),
        ),
        child: Stack(
          children: [
            // Logo
            Positioned(
              top: screenHeight * 0.1,
              left: screenWidth * 0.3,
              child: Image.asset(
                'assets/images/logo.png',
                width: screenWidth * 0.4,
                height: screenHeight * 0.2,
              ),
            ),

            // Text Content
            Positioned(
              top: screenHeight * 0.35,
              left: screenWidth * 0.08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ready\nSet, Push!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.11,
                      color: const Color(0xFF08244B),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: screenWidth * 0.45,
                    child: Text(
                      'Get the fitness challenge with us for your strong body',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.03,
                        color: const Color(0xFF787878),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sportive Woman Image
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/sportive_woman.png',
                width: screenWidth * 0.6,
                fit: BoxFit.contain,
              ),
            ),

            // Get Started Button
            Positioned(
              top: screenHeight * 0.75,
              left: (screenWidth - (screenWidth * 0.5)) / 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    color: const Color(0xFFD9D9D9),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.05,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
