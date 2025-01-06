import 'package:flutter/material.dart';
import 'workoutsmenu/WorkoutsMenuHeader.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate font sizes based on screen width
    final double titleFontSize = screenWidth * 0.055; // 6.5% of screen width
    final double contentFontSize = screenWidth * 0.035; // 3.5% of screen width

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SafeArea(
        child: Column(
          children: [
            WorkoutsMenuHeader(
              title: 'Terms & Conditions',
              onBackPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.all(screenWidth * 0.05), // 5% of screen width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Workout Achievement',
                        style: TextStyle(
                          fontFamily: 'Inter', // Assuming 'Inter' is available
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                          color: const Color(
                              0xFF08244b), // Use #08244b for the text color
                        ),
                      ),
                      SizedBox(
                          height: screenWidth * 0.02), // 2% of screen width
                      Text(
                        'Last Updated: January 04, 2025',
                        style: TextStyle(
                          fontFamily: 'Poppins', // Use Poppins for this text
                          fontSize: contentFontSize,
                          color: Colors.grey[600],
                        ),
                      ), // 4% of screen width
                      _buildSection(
                        context,
                        title: '1. Acceptance of Terms',
                        content:
                            'By accessing and using the Workout Achievement app, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, please do not use our services.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '2. User Accounts',
                        content:
                            'You are responsible for maintaining the confidentiality of your account credentials and for all activities under your account. You must immediately notify us of any unauthorized use of your account.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '3. Fitness Disclaimer',
                        content:
                            'The workout and fitness information provided in this app is for educational purposes only. You should consult your physician before starting any exercise program. By using our app, you agree that you do so at your own risk.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '4. User Content',
                        content:
                            'By submitting content to our app, you grant us a worldwide, non-exclusive, royalty-free license to use, reproduce, and distribute your content in connection with our services.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '5. Privacy Policy',
                        content:
                            'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your personal information. By using our app, you agree to our privacy practices.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '6. App Usage Rules',
                        content: '''Users agree to:
• Not share account credentials
• Not misuse the app's features
• Not upload harmful content
• Not attempt to breach app security
• Respect other users' privacy''',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '7. Subscription Terms',
                        content:
                            'Premium features require a paid subscription. Subscriptions automatically renew unless cancelled. Refunds are subject to our refund policy.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '8. Limitation of Liability',
                        content:
                            'We are not liable for any injuries, damages, or losses resulting from the use of our app or following the workout programs provided.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '9. Modifications',
                        content:
                            'We reserve the right to modify these terms at any time. Continued use of the app after changes constitutes acceptance of new terms.',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      _buildSection(
                        context,
                        title: '10. Contact Information',
                        content:
                            'For questions about these terms, please contact us at: support@workoutachievement.com',
                        titleFontSize: titleFontSize,
                        contentFontSize: contentFontSize,
                      ),
                      SizedBox(
                          height: screenWidth * 0.06), // 6% of screen width
                      Container(
                        padding: EdgeInsets.all(
                            screenWidth * 0.04), // 4% of screen width
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFD9D9D9), // Use #d9d9d9 for the container background
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xFF08244b).withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Questions?',
                              style: TextStyle(
                                fontFamily:
                                    'Inter', // Assuming 'Inter' is available
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w500,
                                color: Colors
                                    .black, // Use black color for the text
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenWidth * 0.02), // 2% of screen width
                            Text(
                              'If you have any questions about our Terms and Conditions, please contact our support team.',
                              style: TextStyle(
                                fontFamily:
                                    'Poppins', // Use Poppins for this text
                                fontSize: contentFontSize,
                                color: Colors
                                    .black, // Use black color for the text
                              ),
                            ),
                            SizedBox(
                                height:
                                    screenWidth * 0.04), // 4% of screen width
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to Contact Support or launch email
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenWidth *
                                          0.03), // 3% of screen width
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: const Color(
                                      0xFF08244b), // Use #08244b for button background
                                ),
                                child: const Text(
                                  'Contact Support',
                                  style: TextStyle(
                                    fontFamily:
                                        'Poppins', // Use Poppins for this text
                                    fontWeight: FontWeight.w500,
                                    color: Colors
                                        .white, // Use white color for the button text
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
    required double titleFontSize,
    required double contentFontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height:
                MediaQuery.of(context).size.width * 0.06), // 6% of screen width
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter', // Assuming 'Inter' is available
            fontSize: titleFontSize,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF08244b), // Use #08244b for the title color
          ),
        ),
        SizedBox(
            height:
                MediaQuery.of(context).size.width * 0.02), // 2% of screen width
        Text(
          content,
          style: TextStyle(
            fontFamily: 'Poppins', // Use Poppins for this text
            fontSize: contentFontSize,
            height: 1.5,
            color: Colors.black, // Use black color for the content text
          ),
        ),
      ],
    );
  }
}
