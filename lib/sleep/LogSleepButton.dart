import 'package:flutter/material.dart';

class LogSleepButton extends StatelessWidget {
  const LogSleepButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sleep data logged successfully')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD9D9D9),
        minimumSize: const Size(104, 39),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(0xFF787878), // Border color
            width: 1, // Border width
          ), // Change the border radius here
        ),
      ),
      child: const Text(
        'Log Sleep',
        style: TextStyle(
          color: Colors.black, // Change the font color here
        ),
      ),
    );
  }
}
