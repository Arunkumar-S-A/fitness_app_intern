// profile_screen.dart
import 'package:flutter/material.dart';
import 'EditProfilePage.dart';
import 'BottomNavigation.dart';

// User Profile Model
class UserProfile {
  String username;
  String email;
  String phone;
  String location;
  String name;
  String bio;

  UserProfile({
    required this.username,
    required this.email,
    required this.phone,
    required this.location,
    required this.name,
    this.bio = '',
  });
}

// Shared utility class for common widgets
class InfoItemWidget {
  static Widget buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: const Color(0xFF08244B)),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Color(0xFF08244B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF08244B),
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 36, bottom: 8),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Color(0xFF08244B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Main Profile Screen
class ProfileScreen extends StatefulWidget {
  final bool fromDashboard;

  const ProfileScreen({super.key, required this.fromDashboard});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    userProfile = UserProfile(
      username: 'Mary',
      email: 'abc@outlook.com',
      phone: '+91 9361439346',
      location: 'Madurai',
      name: 'Angelin Mary',
      bio: 'Flutter Developer',
    );
  }

  void updateProfile(UserProfile updatedProfile) {
    setState(() {
      userProfile = updatedProfile;
    });
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: isSelected ? Colors.black : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  void _navigateBack() {
    if (widget.fromDashboard) {
      Navigator.pop(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
    }
  }

  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProfilePage(userProfile: userProfile)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _navigateBack,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _navigateToEditProfile,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth * 0.9, // Use 90% of the screen width
            height: screenHeight,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: screenWidth * 0.25, // Dynamic size
                                height: screenWidth * 0.25, // Dynamic size
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFE0E0E0),
                                    width: 2,
                                  ),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: screenWidth * 0.04), // Dynamic spacing
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userProfile.name,
                                      style: TextStyle(
                                        fontSize: screenWidth *
                                            0.06, // Dynamic font size
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF08244B),
                                      ),
                                    ),
                                    SizedBox(
                                        height: screenWidth *
                                            0.01), // Dynamic spacing
                                    Text(
                                      userProfile.bio,
                                      style: TextStyle(
                                        fontSize: screenWidth *
                                            0.04, // Dynamic font size
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFF08244B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: screenWidth * 0.06), // Dynamic spacing
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PersonalInfoPage(
                                                    userProfile: userProfile),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: screenWidth *
                                                0.01), // Dynamic margin
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFF787878),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: const Color(0xFFD9D9D9),
                                        ),
                                        child: _buildTabButton(
                                            'Personal Info', true),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ConnectionsPage(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: screenWidth *
                                                0.01), // Dynamic margin
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFF787878),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: _buildTabButton(
                                            'Connections', false),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      screenWidth * 0.06), // Dynamic spacing
                              Column(
                                children: [
                                  InfoItemWidget.buildInfoItem(
                                    Icons.person_outline,
                                    'Username',
                                    userProfile.username,
                                  ),
                                  InfoItemWidget.buildInfoItem(
                                    Icons.email_outlined,
                                    'Email',
                                    userProfile.email,
                                  ),
                                  InfoItemWidget.buildInfoItem(
                                    Icons.phone_outlined,
                                    'Phone',
                                    userProfile.phone,
                                  ),
                                  InfoItemWidget.buildInfoItem(
                                    Icons.location_on_outlined,
                                    'Location',
                                    userProfile.location,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Personal Info Page
class PersonalInfoPage extends StatelessWidget {
  final UserProfile userProfile;

  const PersonalInfoPage({
    super.key,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info'),
        backgroundColor: const Color(0xFFD9D9D9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoItemWidget.buildInfoItem(
              Icons.person_outline,
              'Username',
              userProfile.username,
            ),
            InfoItemWidget.buildInfoItem(
              Icons.email_outlined,
              'Email',
              userProfile.email,
            ),
            InfoItemWidget.buildInfoItem(
              Icons.phone_outlined,
              'Phone',
              userProfile.phone,
            ),
            InfoItemWidget.buildInfoItem(
              Icons.location_on_outlined,
              'Location',
              userProfile.location,
            ),
            InfoItemWidget.buildInfoItem(
              Icons.info_outline,
              'Bio',
              userProfile.bio,
            ),
          ],
        ),
      ),
    );
  }
}

// Connections Page
class ConnectionsPage extends StatelessWidget {
  const ConnectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connections'),
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          'Connections Page Content',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
