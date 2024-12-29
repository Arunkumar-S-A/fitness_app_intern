import 'package:flutter/material.dart';

class NutritionHeader extends StatelessWidget {
  final String title;

  const NutritionHeader({
    Key? key,
    this.title = 'Nutrition',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: width * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: width * 0.08,
            fontWeight: FontWeight.w400,
            color: Color(0xFF111111),
          ),
        ),
      ),
    );
  }
}
