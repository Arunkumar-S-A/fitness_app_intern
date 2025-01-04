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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: const Color(0xFFD5C6C6)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.15),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF111111),
                  ),
                ),
                const SizedBox(height: 25),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 30),
                _buildForgotPasswordAndSignup(),
                const SizedBox(height: 17),
                _buildSubmitButton(width),
                const SizedBox(height: 66),
                _buildOrConnectVia(),
                const SizedBox(height: 26),
                _buildSocialIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF08244B),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          height: 57,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              const SizedBox(width: 13),
              const Icon(Icons.email, size: 22, color: Colors.grey),
              const SizedBox(width: 11),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Color(0xFF111111),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF08244B),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          height: 57,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.lock, size: 22, color: Colors.grey),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Color(0xFF111111),
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

  Widget _buildForgotPasswordAndSignup() {
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
          child: const Text(
            'Signup',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xFF111111),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xFF111111),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(double width) {
    return Container(
      width: width * 0.4,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
          );
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildOrConnectVia() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            endIndent: 10,
          ),
        ),
        Text(
          'Or connect via',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Color(0xFF111111),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
            indent: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/google.png', width: 40, height: 40),
        const SizedBox(width: 60),
        Image.asset('assets/images/facebook.png', width: 40, height: 40),
        const SizedBox(width: 60),
        Image.asset('assets/images/instagram.png', width: 40, height: 40),
      ],
    );
  }
}
