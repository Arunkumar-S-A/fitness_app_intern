import 'package:flutter/material.dart';
import '../DashBoard.dart'; // Import the DashBoard widget

class HomeHeader extends StatefulWidget {
  final String name;
  final String imagePath; // Local image path
  final VoidCallback onNotificationTap;

  const HomeHeader({
    super.key,
    this.name = 'Mary', // Default value
    this.imagePath = 'assets/images/profile.png', // Local profile image
    required this.onNotificationTap,
  });

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showDashboard() {
    _controller.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SlideTransition(
          position: _offsetAnimation,
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.only(top: 0),
                child: const DashBoard(),
              ),
            ),
          ),
        );
      },
    ).then((_) => _controller.reverse());
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.03),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: _showDashboard,
                child: CircleAvatar(
                  radius: width * 0.08,
                  backgroundImage: AssetImage(widget.imagePath),
                ),
              ),
              SizedBox(width: width * 0.06),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getGreeting(),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF08244B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: widget.onNotificationTap,
            child: Container(
              padding: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications,
                size: width * 0.08,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
