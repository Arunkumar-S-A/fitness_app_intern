/* lib/ContactUsScreen.dart */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'workoutsmenu/WorkoutsMenuHeader.dart'; // Adjust the import path as necessary

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              WorkoutsMenuHeader(
                title: 'Contact Us',
                onBackPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get in Touch',
                      style: TextStyle(
                        fontSize: screenWidth * 0.065,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF08244b),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      'We\'d love to hear from you. Please fill out this form.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextFormField(
                            controller: _nameController,
                            label: 'Full Name',
                            icon: Icons.person_outline,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          _buildTextFormField(
                            controller: _emailController,
                            label: 'Email',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value!)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          _buildTextFormField(
                            controller: _subjectController,
                            label: 'Subject',
                            icon: Icons.subject,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter a subject';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          _buildTextFormField(
                            controller: _messageController,
                            label: 'Message',
                            icon: Icons.message_outlined,
                            maxLines: 5,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenWidth * 0.06),
                          SizedBox(
                            width: double.infinity,
                            height: screenWidth * 0.12,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD9D9D9),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color: Colors.black, width: 0.5),
                                ),
                              ),
                              child: Text(
                                'Send Message',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.1),
                    Text(
                      'Other Ways to Contact Us',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF08244b),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    _buildContactMethod(
                      icon: Icons.phone_outlined,
                      title: 'Phone',
                      content: '+1 234 567 890',
                      onTap: () => _launchURL('tel:+1234567890'),
                    ),
                    _buildContactMethod(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      content: 'support@gymapp.com',
                      onTap: () => _launchURL('mailto:support@gymapp.com'),
                    ),
                    _buildContactMethod(
                      icon: Icons.location_on_outlined,
                      title: 'Address',
                      content: '123 Fitness Street, Gym City, GC 12345',
                      onTap: () => _launchURL(
                          'https://maps.google.com/?q=123+Fitness+Street'),
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

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          color: const Color(0xFF08244b),
          fontSize: screenWidth * 0.04,
        ),
        prefixIcon: Icon(icon, color: const Color(0xFF08244b)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF08244b)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
    );
  }

  Widget _buildContactMethod({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF08244b),
                size: screenWidth * 0.06,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF08244b),
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: screenWidth * 0.04,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically send the form data to your backend
      // For now, we'll just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
