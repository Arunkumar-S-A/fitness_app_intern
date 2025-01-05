/* lib/sleep/LogSleepButton.dart */
import 'package:flutter/material.dart';

class LogSleepButton extends StatelessWidget {
  const LogSleepButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sleep data logged successfully')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD9D9D9),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
          vertical: screenWidth * 0.03,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.035),
          side: const BorderSide(
            color: Color(0xFF787878), // Border color
            width: 1, // Border width
          ),
        ),
      ),
      child: Text(
        'Log Sleep',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black, // Font color
          fontSize: screenWidth * 0.035, // Responsive font size
        ),
      ),
    );
  }
}
