/* lib/HelpScreen.dart */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'workoutsmenu/WorkoutsMenuHeader.dart'; // Adjust the import path as necessary

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: 'How do I track my workout progress?',
      answer:
          'You can track your workout progress by going to the Dashboard and clicking on "My Progress". Here you can view your workout history, achievements, and statistics.',
    ),
    FAQItem(
      question: 'How do I create a custom workout plan?',
      answer:
          'To create a custom workout plan, go to the "Workouts" tab and click on "Create Custom Plan". You can then select exercises, sets, reps, and schedule your workouts.',
    ),
    FAQItem(
      question: 'Can I sync my fitness device?',
      answer:
          'Yes! We support syncing with various fitness devices. Go to Settings > Connected Devices to pair your fitness tracker or smartwatch.',
    ),
    FAQItem(
      question: 'How do I update my profile information?',
      answer:
          'You can update your profile information by going to Settings > Edit Profile. Here you can change your personal details, fitness goals, and profile picture.',
    ),
    FAQItem(
      question: 'What should I do if I forget my password?',
      answer:
          'If you forget your password, click on the "Forgot Password" link on the login screen. We\'ll send you instructions to reset your password via email.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              WorkoutsMenuHeader(
                title: 'Help Center',
                onBackPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick Help Section
                    Text(
                      'Quick Help',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF08244b),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),

                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: screenWidth * 0.04,
                      crossAxisSpacing: screenWidth * 0.04,
                      childAspectRatio: 1.5,
                      children: [
                        _buildQuickHelpCard(
                          icon: Icons.video_library,
                          title: 'Video Tutorials',
                          onTap: () {
                            // Navigate to video tutorials
                          },
                        ),
                        _buildQuickHelpCard(
                          icon: Icons.chat,
                          title: 'Live Chat',
                          onTap: () {
                            // Open live chat
                          },
                        ),
                        _buildQuickHelpCard(
                          icon: Icons.email,
                          title: 'Email Support',
                          onTap: () => _launchEmail(),
                        ),
                        _buildQuickHelpCard(
                          icon: Icons.phone,
                          title: 'Call Us',
                          onTap: () => _launchPhone(),
                        ),
                      ],
                    ),

                    SizedBox(height: screenWidth * 0.06),

                    // FAQ Section
                    Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF08244b),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _faqs.length,
                      itemBuilder: (context, index) {
                        return _buildFAQCard(_faqs[index]);
                      },
                    ),

                    SizedBox(height: screenWidth * 0.06),

                    // Still Need Help Section
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Still Need Help?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF08244b),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            'Our support team is here to help you 24/7.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: screenWidth * 0.035,
                              color: const Color(0xFF08244b),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.04),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _launchEmail(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.white, // Button background color
                                foregroundColor: const Color(
                                    0xFF08244b), // Button text color
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.03),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color: Colors.black,
                                      width: 0.5), // Button border color
                                ),
                              ),
                              child: const Text(
                                'Contact Support',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickHelpCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: screenWidth * 0.08,
                color: const Color(0xFF08244b),
              ),
              SizedBox(height: screenWidth * 0.02),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF08244b),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQCard(FAQItem faq) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.only(bottom: screenWidth * 0.03),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(
          faq.question,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Color(0xFF08244b),
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              faq.answer,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@workoutachievement.com',
      queryParameters: {'subject': 'Help Request'},
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+1234567890',
    );
    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    }
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
