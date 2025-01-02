import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final Function(int)? onDateSelected;
  final int initialSelectedIndex;

  const DateSelector({
    super.key,
    this.onDateSelected,
    this.initialSelectedIndex = 4,
  });

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late int selectedIndex;
  late List<DateItem> dates;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
    dates = _generateDates();
  }

  List<DateItem> _generateDates() {
    DateTime now = DateTime.now();
    return List.generate(30, (index) {
      DateTime date = now.subtract(Duration(days: index));
      return DateItem(
        day: DateFormat('d').format(date),
        month: DateFormat('MMM').format(date),
      );
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: width * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemExtent: width / 9, // Show 9 items at a time
        itemBuilder: (context, index) {
          return DateButton(
            date: dates[index],
            isSelected: index == selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onDateSelected?.call(index);
            },
            width: width,
          );
        },
      ),
    );
  }
}

class DateButton extends StatelessWidget {
  final DateItem date;
  final bool isSelected;
  final VoidCallback? onTap;
  final double width;

  const DateButton({
    super.key,
    required this.date,
    this.isSelected = false,
    this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width / 9,
        height: width * 0.15,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: width * 0.035,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF111111),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date.month,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: width * 0.025,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF787878),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateItem {
  final String day;
  final String month;

  const DateItem({
    required this.day,
    required this.month,
  });
}
