/* lib/home/NavigationTabs.dart */
import 'package:flutter/material.dart';

class NavigationTabs extends StatefulWidget {
  final Function(int) onTabChanged;
  final int initialIndex;

  const NavigationTabs({
    super.key,
    required this.onTabChanged,
    this.initialIndex = 0,
  });

  @override
  _NavigationTabsState createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTab("Discover", Icons.explore, 0, screenWidth),
              _buildTab("Trainers", Icons.people, 1, screenWidth),
              _buildTab("My Plan", Icons.assignment, 2, screenWidth),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Stack(
            children: [
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getIndicatorPosition(screenWidth),
                child: Container(
                  width: screenWidth / 3 - screenWidth * 0.16,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, IconData icon, int index, double screenWidth) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTabChanged(index);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: screenWidth * 0.07,
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  double _getIndicatorPosition(double screenWidth) {
    return _selectedIndex * (screenWidth / 3);
  }
}

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sleep Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nutrition Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Workout Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
