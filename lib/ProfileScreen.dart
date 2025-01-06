/* lib/ProfileScreen.dart */
import 'package:flutter/material.dart';
import 'EditProfilePage.dart';
import 'BottomNavigation.dart';
import 'forms/UserData.dart';

class ProfileHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onEditPressed;

  const ProfileHeader({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPressed ?? () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(width * 0.01),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back,
                  size: width * 0.06, color: Colors.black),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onEditPressed,
            child: Container(
              padding: EdgeInsets.all(width * 0.01),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, size: width * 0.06, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

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
                  fontFamily: 'Inter',
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

class ProfileScreen extends StatefulWidget {
  final bool fromDashboard;

  const ProfileScreen({super.key, required this.fromDashboard});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfile userProfile;
  final UserData userData = UserData();

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

  void _navigateBack() {
    if (widget.fromDashboard) {
      Navigator.pop(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
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
          fontFamily: 'Inter',
          color: isSelected ? Colors.black : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(
              title: 'My Profile',
              onBackPressed: _navigateBack,
              onEditPressed: _navigateToEditProfile,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: screenWidth * 0.25,
                            height: screenWidth * 0.25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFE0E0E0),
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/profile.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userProfile.name,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.06,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF08244B),
                                  ),
                                ),
                                SizedBox(height: screenWidth * 0.01),
                                Text(
                                  userProfile.bio,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFF08244B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.06),
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
                                        builder: (context) => PersonalInfoPage(
                                            userProfile: userProfile),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.01),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF787878),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xFFD9D9D9),
                                    ),
                                    child:
                                        _buildTabButton('Personal Info', true),
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
                                        horizontal: screenWidth * 0.01),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF787878),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child:
                                        _buildTabButton('Connections', false),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenWidth * 0.06),
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
                              InfoItemWidget.buildInfoItem(
                                Icons.local_fire_department,
                                'Calories Budget',
                                '${userData.calorieBudget.toInt()} kcal',
                              ),
                              InfoItemWidget.buildInfoItem(
                                Icons.fitness_center,
                                'Workouts Per Week',
                                '${userData.workoutsPerWeek}',
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
    );
  }
}

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
            fontFamily: 'Inter',
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
