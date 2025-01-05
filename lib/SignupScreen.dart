import 'package:flutter/material.dart';
import 'forms/AgeSelectorScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController _emailController =
      TextEditingController(text: 'abcd@outlook.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '********');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: '********');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'Join us',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.09,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF111111),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildEmailField(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildPasswordField(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildConfirmPasswordField(screenWidth),
              const Spacer(),
              Center(child: _buildRegisterButton(screenWidth)),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF08244B),
          ),
        ),
        SizedBox(height: screenWidth * 0.005),
        Container(
          height: screenWidth * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.03),
              const Icon(Icons.email, size: 22, color: Colors.grey),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.04,
                    color: const Color(0xFF111111),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF08244B),
          ),
        ),
        SizedBox(height: screenWidth * 0.005),
        Container(
          height: screenWidth * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.03),
              const Icon(Icons.lock, size: 22, color: Colors.grey),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.04,
                    color: const Color(0xFF111111),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  size: 22,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirm Password',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF08244B),
          ),
        ),
        SizedBox(height: screenWidth * 0.005),
        Container(
          height: screenWidth * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.03),
              const Icon(Icons.lock, size: 22, color: Colors.grey),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm your password',
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.04,
                    color: const Color(0xFF111111),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 22,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(double screenWidth) {
    return Container(
      width: screenWidth * 0.45,
      height: screenWidth * 0.14,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AgeSelectorScreen()),
          );
        },
        child: Text(
          'Register',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
