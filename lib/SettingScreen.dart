import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'LoginScreen.dart';
import 'workoutsmenu/WorkoutsMenuHeader.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool workoutReminders = true;
  String selectedLanguage = 'English';
  String selectedUnit = 'Metric (kg, cm)';
  String appVersion = '1.0.0';

  // Public variable to store screen width
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        appVersion = packageInfo.version;
      });
    } catch (e) {
      print('Failed to get app version: $e');
    }
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        List<bool> starStates = List.filled(5, false);
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Rate Our App',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: const Color(0xFF08244B),
                  fontSize: screenWidth * 0.05,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'How would you rate your experience with our app?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => IconButton(
                        icon: Icon(
                          starStates[index] ? Icons.star : Icons.star_border,
                          size: screenWidth * 0.08,
                          color: starStates[index] ? Colors.amber : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            for (int i = 0; i <= index; i++) {
                              starStates[i] = true;
                            }
                            for (int i = index + 1; i < 5; i++) {
                              starStates[i] = false;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Maybe Later',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF08244B),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Thank you for your rating!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF08244B),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width; // Initialize screenWidth

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            WorkoutsMenuHeader(
              title: 'Settings',
              onBackPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                children: [
                  _buildSectionHeader('Account Settings'),
                  _buildListTile(
                    'Edit Profile',
                    Icons.person_outline,
                    onTap: () {
                      // Navigate to profile editing screen
                    },
                  ),
                  _buildListTile(
                    'Change Password',
                    Icons.lock_outline,
                    onTap: () {
                      // Navigate to password change screen
                    },
                  ),
                  _buildListTile(
                    'Privacy Settings',
                    Icons.privacy_tip_outlined,
                    onTap: () {
                      // Navigate to privacy settings
                    },
                  ),
                  _buildSectionHeader('App Settings'),
                  _buildSwitchTile(
                    'Push Notifications',
                    Icons.notifications_outlined,
                    notificationsEnabled,
                    (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    'Workout Reminders',
                    Icons.alarm,
                    workoutReminders,
                    (value) {
                      setState(() {
                        workoutReminders = value;
                      });
                    },
                  ),
                  _buildListTile(
                    'Language',
                    Icons.language,
                    trailing: Text(
                      selectedLanguage,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    onTap: () {
                      _showLanguageDialog();
                    },
                  ),
                  _buildListTile(
                    'Units',
                    Icons.straighten,
                    trailing: Text(
                      selectedUnit,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    onTap: () {
                      _showUnitDialog();
                    },
                  ),
                  _buildSectionHeader('Support'),
                  _buildListTile(
                    'Help Center',
                    Icons.help_outline,
                    onTap: () {
                      _launchURL('https://yourapp.com/help');
                    },
                  ),
                  _buildListTile(
                    'Contact Support',
                    Icons.support_agent,
                    onTap: () {
                      _launchEmail();
                    },
                  ),
                  _buildListTile(
                    'Report a Bug',
                    Icons.bug_report_outlined,
                    onTap: () {
                      _launchEmail();
                    },
                  ),
                  _buildSectionHeader('About'),
                  _buildListTile(
                    'Rate App',
                    Icons.star_outline,
                    onTap: () => _showRatingDialog(),
                  ),
                  _buildListTile(
                    'Share App',
                    Icons.share_outlined,
                    onTap: () {
                      Share.share('Check out this amazing gym app!');
                    },
                  ),
                  _buildListTile(
                    'Privacy Policy',
                    Icons.policy_outlined,
                    onTap: () {
                      _launchURL('https://yourapp.com/privacy');
                    },
                  ),
                  _buildListTile(
                    'Terms of Service',
                    Icons.description_outlined,
                    onTap: () {
                      _launchURL('https://yourapp.com/terms');
                    },
                  ),
                  _buildListTile(
                    'App Version',
                    Icons.info_outline,
                    trailing: Text(
                      appVersion,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  _buildSectionHeader('Account Actions'),
                  _buildListTile(
                    'Clear Cache',
                    Icons.cleaning_services_outlined,
                    onTap: () {
                      _showClearCacheDialog();
                    },
                  ),
                  _buildListTile(
                    'Log Out',
                    Icons.logout,
                    textColor: Colors.red,
                    onTap: () {
                      _showLogoutDialog();
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: const Color(0xFF08244B),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon,
      {VoidCallback? onTap, Widget? trailing, Color? textColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFd9d9d9), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF08244B)),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: textColor ?? Colors.black,
            fontSize: screenWidth * 0.04,
          ),
        ),
        trailing: trailing ??
            (onTap != null
                ? const Icon(Icons.chevron_right, color: Color(0xFF08244B))
                : null),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile(
      String title, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFd9d9d9), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: screenWidth * 0.04,
          ),
        ),
        secondary: Icon(icon, color: const Color(0xFF08244B)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.green, // Define active color
        inactiveThumbColor: Colors.grey, // Define inactive color
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@yourapp.com',
      queryParameters: {'subject': 'Support Request'},
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch email client');
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Select Language',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: const Color(0xFF08244B),
            fontSize: screenWidth * 0.05,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'English',
            'Spanish',
            'French',
            'German',
            'Chinese',
          ]
              .map((language) => RadioListTile(
                    title: Text(
                      language,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    value: language,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value.toString();
                      });
                      Navigator.pop(context);
                    },
                    activeColor: const Color(
                        0xFF08244B), // Define the color of the selected radio button
                    // Define the background color of the tile
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _showUnitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Select Unit System',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: const Color(0xFF08244B),
            fontSize: screenWidth * 0.05,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'Metric (kg, cm)',
            'Imperial (lb, in)',
          ]
              .map((unit) => RadioListTile(
                    title: Text(
                      unit,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    value: unit,
                    groupValue: selectedUnit,
                    onChanged: (value) {
                      setState(() {
                        selectedUnit = value.toString();
                      });
                      Navigator.pop(context);
                    },
                    activeColor: const Color(
                        0xFF08244B), // Define the color of the selected radio button
                    // Define the background color of the tile
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Clear Cache',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: const Color(0xFF08244B),
            fontSize: screenWidth * 0.04,
          ),
        ),
        content: Text(
          'Are you sure you want to clear the app cache? This will not delete any of your personal data.',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: screenWidth * 0.04,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xFF08244B),
                fontSize: screenWidth * 0.04,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Clear',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xFF08244B),
                fontSize: screenWidth * 0.04,
              ),
            ),
            onPressed: () {
              // Implement cache clearing logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cache cleared successfully')),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Log Out',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: const Color(0xFF08244B),
            fontSize: screenWidth * 0.05,
          ),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: screenWidth * 0.04,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xFF08244B),
                fontSize: screenWidth * 0.04,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.red,
                fontSize: screenWidth * 0.04,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
