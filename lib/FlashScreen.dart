import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Stack(
          children: [
            // Logo
            Positioned(
              top: height * 0.1,
              left: width * 0.3,
              child: Image.asset(
                'assets/images/logo.png',
                width: width * 0.4,
                height: height * 0.2,
              ),
            ),

            // Text Content
            Positioned(
              top: height * 0.35,
              left: 30,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ready\nSet, Push!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 44,
                      color: Color(0xFF08244B),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    child: Text(
                      'Get the fitness challenge with us for your strong body',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF787878),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sportive Woman Image
            Positioned(
              top: height * 0.1,
              left: width * 0.4,
              child: Image.asset(
                'assets/images/sportive_woman.png',
                width: 249,
                height: 832,
                fit: BoxFit.cover,
              ),
            ),

            // Get Started Button
            Positioned(
              top: height * 0.75,
              left:
                  (width - (width * 0.5)) / 2, // Center the button horizontally
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  width: width * 0.5,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                  child: const Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
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
