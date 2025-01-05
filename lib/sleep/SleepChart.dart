/* lib/sleep/SleepChart.dart */
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepChart extends StatefulWidget {
  const SleepChart({super.key});

  @override
  _SleepChartState createState() => _SleepChartState();
}

class _SleepChartState extends State<SleepChart> {
  bool showLastWeek = true;

  List<FlSpot> _getSleepData() {
    if (showLastWeek) {
      return [
        const FlSpot(0, 7),
        const FlSpot(1, 6.5),
        const FlSpot(2, 8),
        const FlSpot(3, 7.5),
        const FlSpot(4, 6),
        const FlSpot(5, 7),
        const FlSpot(6, 8),
      ];
    } else {
      return List.generate(
        30,
        (index) =>
            FlSpot(index.toDouble(), 5 + (index % 5) * 0.5 + (index % 2)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: screenWidth * 0.7,
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                showLastWeek
                    ? 'Last Week Sleep Stats'
                    : 'Last Month Sleep Stats',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Expanded(
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: showLastWeek ? 6 : 29,
                    minY: 0,
                    maxY: 10,
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 1,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey[300]!,
                        strokeWidth: 1,
                      ),
                      getDrawingVerticalLine: (value) => FlLine(
                        color: Colors.grey[300]!,
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (showLastWeek) {
                              switch (value.toInt()) {
                                case 0:
                                  return const Text('Mon');
                                case 1:
                                  return const Text('Tue');
                                case 2:
                                  return const Text('Wed');
                                case 3:
                                  return const Text('Thu');
                                case 4:
                                  return const Text('Fri');
                                case 5:
                                  return const Text('Sat');
                                case 6:
                                  return const Text('Sun');
                                default:
                                  return const Text('');
                              }
                            } else {
                              return Text('${value.toInt() + 1}');
                            }
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 2,
                          reservedSize: screenWidth * 0.1,
                          getTitlesWidget: (value, meta) {
                            return Text('${value.toInt()} hrs');
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: const Color(0xFF787878)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _getSleepData(),
                        isCurved: true,
                        color: Colors.blue[400],
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue[100]?.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildToggleButton('Last Week', showLastWeek),
            const SizedBox(width: 10),
            _buildToggleButton('Last Month', !showLastWeek),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          showLastWeek = text == 'Last Week';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFFD9D9D9) : Colors.white,
        side: const BorderSide(color: Colors.black, width: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
