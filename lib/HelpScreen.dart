import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quick Help Section
              const Text(
                'Quick Help',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
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

              const SizedBox(height: 32),

              // FAQ Section
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  return _buildFAQCard(_faqs[index]);
                },
              ),

              const SizedBox(height: 32),

              // Still Need Help Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Still Need Help?',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Our support team is here to help you 24/7.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _launchEmail(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }

  Widget _buildQuickHelpCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
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
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
