import 'package:flutter/material.dart';
import 'TargetWeightPage.dart';

class DiseaseSelectionScreen extends StatefulWidget {
  const DiseaseSelectionScreen({super.key});

  @override
  _DiseaseSelectionScreenState createState() => _DiseaseSelectionScreenState();
}

class _DiseaseSelectionScreenState extends State<DiseaseSelectionScreen> {
  Set<String> selectedDiseases = {};

  final List<String> diseases = [
    'Heart Attack',
    'Stroke',
    'Arthritis',
    'Dementia',
    'Hypertension',
    'Anemia',
    'Lower Back Pain',
    'Tendinitis',
    'Diabetes',
    'Asthma',
    'Cancer',
    'Migraine',
  ];

  bool showAllDiseases = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final displayedDiseases =
        showAllDiseases ? diseases : diseases.take(8).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Text(
                  'Select the diseases that you have',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: width * 0.08,
                    color: const Color(0xFF08244B),
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.04),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width < 600 ? 2 : 3,
                    crossAxisSpacing: width * 0.04,
                    mainAxisSpacing: height * 0.03,
                    childAspectRatio: 3,
                  ),
                  itemCount: displayedDiseases.length,
                  itemBuilder: (context, index) {
                    final disease = displayedDiseases[index];
                    final isSelected = selectedDiseases.contains(disease);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedDiseases.remove(disease);
                          } else {
                            selectedDiseases.add(disease);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFD9D9D9)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          disease,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: width * 0.045,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAllDiseases = !showAllDiseases;
                    });
                  },
                  child: Text(
                    showAllDiseases ? 'Show Less' : 'See More',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF08244B),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Container(
                  width: width * 0.4,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xFFd9d9d9),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Selected',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TargetWeightPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    7,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: width * 0.02,
                      height: width * 0.02,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 4
                            ? Colors.black
                            : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
