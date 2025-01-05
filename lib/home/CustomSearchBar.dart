/* lib/home/CustomSearchBar.dart */
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? placeholder;
  final Function(String)? onSearch;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.placeholder = 'Search',
    this.onSearch,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9, // 90% of screen width
      height: screenWidth * 0.12, // Adjust height based on screen width
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.03, right: screenWidth * 0.03),
            child: Icon(
              Icons.search,
              size: screenWidth * 0.06,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onSearch,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF111111),
              ),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87.withOpacity(0.5),
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: screenWidth * 0.02),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
