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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: _showDashboard,
                child: CircleAvatar(
                  radius: width * 0.07,
                  backgroundImage: AssetImage(widget.imagePath),
                ),
              ),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning,',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: widget.onNotificationTap,
            icon: Icon(
              Icons.notifications,
              size: width * 0.08,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
