import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 412,
        height: 917,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Stack(
          children: [
            // Logo
            Positioned(
              top: 98,
              left: 129,
              child: Image.asset(
                'assets/images/logo.png',
                width: 153.69,
                height: 150,
              ),
            ),

            // Text Content
            const Positioned(
              top: 306,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ready\nSet, Push!',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
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
              top: 85,
              left: 163,
              child: Image.asset(
                'assets/images/sportive_woman.png',
                width: 249,
                height: 832,
                fit: BoxFit.cover,
              ),
            ),

            // Get Started Button
            Positioned(
              top: 695,
              left: 115,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  width: 193,
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
