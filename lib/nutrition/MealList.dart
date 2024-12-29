import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'CameraScreen.dart';
import 'package:camera/camera.dart';

class MealList extends StatefulWidget {
  const MealList({Key? key}) : super(key: key);

  @override
  _MealListState createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  final Map<String, bool> _expandedSections = {
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
    'Snacks': false,
  };

  final Map<String, String> _recommendedCalories = {
    'Breakfast': '574',
    'Lunch': '868',
    'Dinner': '774',
    'Snacks': '231',
  };

  final Map<String, String> _actualCalories = {
    'Breakfast': '',
    'Lunch': '',
    'Dinner': '',
    'Snacks': '',
  };

  final Map<String, String> _foodNames = {
    'Breakfast': 'Breakfast',
    'Lunch': 'Lunch',
    'Dinner': 'Dinner',
    'Snacks': 'Snacks',
  };

  Future<void> _openCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: firstCamera),
      ),
    );
  }

  void _showFoodInputOverlay(String meal) {
    String foodName = '';
    String calories = '';

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Food to $meal',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Food Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  foodName = value;
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Calories',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  calories = value;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _foodNames[meal] = foodName;
                        _actualCalories[meal] = calories;
                      });
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Enter Manually'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _openCamera();
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text('Use Camera'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMealSection(String title, double width) {
    final hasActualCalories = _actualCalories[title]!.isNotEmpty;
    final containerHeight = hasActualCalories ? width * 0.2 : width * 0.15;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _expandedSections[title] = !_expandedSections[title]!;
            });
            _showFoodInputOverlay(title);
          },
          child: Container(
            width: width * 0.95,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _foodNames[title] ?? title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF111111),
                        ),
                      ),
                      Text(
                        'Recommended: ${_recommendedCalories[title]} Cal',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF111111).withOpacity(0.6),
                        ),
                      ),
                      if (hasActualCalories)
                        Text(
                          'Actual: ${_actualCalories[title]} Cal',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  ),
                  Icon(
                    _expandedSections[title]! ? Icons.remove : Icons.add,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildMealSection('Breakfast', width),
          _buildMealSection('Lunch', width),
          _buildMealSection('Dinner', width),
          _buildMealSection('Snacks', width),
        ],
      ),
    );
  }
}
