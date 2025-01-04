import 'package:flutter/material.dart';
import 'DiseaseSelectionScreen.dart';
import 'UserData.dart'; // Import the UserData singleton

class HeightPage extends StatelessWidget {
  const HeightPage({super.key});

  void _onNext(BuildContext context) {
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DiseaseSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: height * 0.06),
              const Center(
                child: Text(
                  "How tall are you?",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF08244B),
                    letterSpacing: -0.4,
                    height: 0.95,
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              Center(
                child: HeightPicker(
                  initialHeight: UserData().currentHeight,
                  onHeightChanged: (height) {
                    UserData().currentHeight =
                        height; // Store height in UserData
                  },
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _onNext(context),
                      child: Container(
                        width: width * 0.4,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        7,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 3
                                ? Colors.black
                                : Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeightPicker extends StatefulWidget {
  final double initialHeight;
  final ValueChanged<double> onHeightChanged;

  const HeightPicker({
    super.key,
    this.initialHeight = 172,
    required this.onHeightChanged,
  });

  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  late double _currentHeight;
  final ScrollController _scrollController = ScrollController();
  static const double minHeight = 120.0; // Minimum height
  static const double maxHeight = 350.0; // Maximum height

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialScrollOffset = (_currentHeight - minHeight) * 20.0;
      _scrollController.jumpTo(initialScrollOffset);
    });
  }

  void _updateHeight(double scrollPosition) {
    final newHeight = (scrollPosition / 20.0) + minHeight;
    if (newHeight >= minHeight && newHeight <= maxHeight) {
      setState(() {
        _currentHeight = newHeight;
      });
      widget.onHeightChanged(_currentHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _currentHeight.toStringAsFixed(0),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 75,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF111111),
                  letterSpacing: -1.5,
                  height: 1.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0, left: 8.0),
                child: Text(
                  'cm',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF111111),
                    letterSpacing: -0.432,
                    height: 1.22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 116,
            width: width * 0.9,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  _updateHeight(scrollNotification.metrics.pixels);
                }
                return true;
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ((maxHeight - minHeight) * 2).toInt(),
                    itemBuilder: (context, index) {
                      final height = minHeight + (index / 2);
                      final isLongMark =
                          height.round() == height && height % 10 == 0;
                      final isMiddleMark =
                          height.round() == height && height % 5 == 0;

                      return Row(
                        children: [
                          Container(
                            width: 2,
                            height: isLongMark ? 56 : (isMiddleMark ? 24 : 16),
                            color: const Color(0xFF111111),
                            margin: EdgeInsets.only(top: isLongMark ? 30 : 46),
                          ),
                          if (isLongMark)
                            Container(
                              width: 4,
                              height: 56,
                              color: const Color(0xFF111111),
                              margin: const EdgeInsets.only(top: 30),
                            ),
                          SizedBox(width: isLongMark ? 8 : 4),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: 30,
                    child: Container(
                      width: 4,
                      height: 56,
                      color: const Color(0xFF111111),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 32,
                    child: SizedBox(
                      width: width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (_currentHeight - 2).toStringAsFixed(0),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF08244B),
                              letterSpacing: -0.028,
                            ),
                          ),
                          Text(
                            (_currentHeight + 2).toStringAsFixed(0),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF08244B),
                              letterSpacing: -0.028,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
