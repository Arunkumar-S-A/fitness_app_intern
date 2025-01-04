import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'ProfileScreen.dart';
import 'SettingScreen.dart';
import 'HelpScreen.dart';
import 'ContactUsScreen.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFD9D9D9),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Angelin Mary',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'abcd@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    _buildMenuItem(context, Icons.person_outline, 'My Profile',
                        const ProfileScreen(fromDashboard: true)),
                    _buildMenuItem(context, Icons.payment, 'Payment',
                        const PaymentScreen()),
                    _buildMenuItem(context, Icons.mail_outline, 'Contact Us',
                        ContactUsScreen()),
                    _buildMenuItem(
                        context, Icons.settings, 'Settings', SettingsScreen()),
                    _buildMenuItem(context, Icons.description_outlined,
                        'Terms and Conditions', const TermsScreen()),
                    _buildMenuItem(
                        context, Icons.help_outline, 'Help', HelpScreen()),
                    _buildMenuItem(context, Icons.chat_bubble_outline,
                        'Chat with our AI assistant', const ChatScreen()),
                    _buildMenuItem(context, Icons.logout_rounded, 'Logout',
                        const LoginScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, Widget screen) {
    return Card(
      elevation: 0,
      color: const Color(0xFFD9D9D9),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
        onTap: () => _navigateToScreen(context, screen),
      ),
    );
  }
}
