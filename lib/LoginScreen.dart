/* lib/LoginScreen.dart */
import 'package:flutter/material.dart';
import 'SignupScreen.dart';
import 'BottomNavigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController =
      TextEditingController(text: 'abcd@outlook.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '********');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.15),
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.09,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF111111),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildEmailField(screenWidth),
                SizedBox(height: screenHeight * 0.02),
                _buildPasswordField(screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildForgotPasswordAndSignup(screenWidth),
                SizedBox(height: screenHeight * 0.02),
                _buildSubmitButton(screenWidth),
                SizedBox(height: screenHeight * 0.08),
                _buildOrConnectVia(screenWidth),
                SizedBox(height: screenHeight * 0.03),
                _buildSocialIcons(screenWidth),
              ],
            ),
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
              const Icon(Icons.lock, size: 22, color: Colors.grey),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
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
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: 22,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordAndSignup(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          child: Text(
            'Signup',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.04,
              color: const Color(0xFF111111),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.04,
              color: const Color(0xFF111111),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(double screenWidth) {
    return Container(
      width: screenWidth * 0.4,
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
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
          );
        },
        child: Text(
          'Submit',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildOrConnectVia(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            endIndent: screenWidth * 0.02,
          ),
        ),
        Text(
          'Or connect via',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: screenWidth * 0.035,
            color: const Color(0xFF111111),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            indent: screenWidth * 0.02,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/google.png',
            width: screenWidth * 0.1, height: screenWidth * 0.1),
        SizedBox(width: screenWidth * 0.15),
        Image.asset('assets/images/facebook.png',
            width: screenWidth * 0.1, height: screenWidth * 0.1),
        SizedBox(width: screenWidth * 0.15),
        Image.asset('assets/images/instagram.png',
            width: screenWidth * 0.1, height: screenWidth * 0.1),
      ],
    );
  }
}
