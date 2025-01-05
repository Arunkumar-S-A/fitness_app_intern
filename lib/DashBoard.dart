/* lib/DashBoard.dart */
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'ProfileScreen.dart';
import 'SettingScreen.dart';
import 'HelpScreen.dart';
import 'ContactUsScreen.dart';
import 'TermsAndConditionsScreen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: const Center(child: Text('Payment Screen')),
    );
  }
}

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms and Conditions')),
      body: const Center(child: Text('Terms Screen')),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat with AI')),
      body: const Center(child: Text('Chat Screen')),
    );
  }
}

// Modified Dashboard with navigation
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFD9D9D9),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      'Angelin Mary',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'abcd@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  children: [
                    _buildMenuItem(context, Icons.person_outline, 'My Profile',
                        const ProfileScreen(fromDashboard: true), screenWidth),
                    _buildMenuItem(context, Icons.payment, 'Payment',
                        const PaymentScreen(), screenWidth),
                    _buildMenuItem(context, Icons.mail_outline, 'Contact Us',
                        ContactUsScreen(), screenWidth),
                    _buildMenuItem(context, Icons.settings, 'Settings',
                        SettingsScreen(), screenWidth),
                    _buildMenuItem(
                        context,
                        Icons.description_outlined,
                        'Terms and Conditions',
                        TermsAndConditionsScreen(),
                        screenWidth),
                    _buildMenuItem(context, Icons.help_outline, 'Help',
                        HelpScreen(), screenWidth),
                    _buildMenuItem(
                        context,
                        Icons.chat_bubble_outline,
                        'Chat with our AI assistant',
                        const ChatScreen(),
                        screenWidth),
                    _buildMenuItem(context, Icons.logout_rounded, 'Logout',
                        const LoginScreen(), screenWidth),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title,
      Widget screen, double screenWidth) {
    return Card(
      elevation: 0,
      color: const Color(0xFFD9D9D9),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.001),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87, size: screenWidth * 0.06),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: screenWidth * 0.04,
          ),
        ),
        onTap: () => _navigateToScreen(context, screen),
      ),
    );
  }
}
