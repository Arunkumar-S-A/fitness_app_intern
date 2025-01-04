import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepChart extends StatelessWidget {
  final TimeOfDay bedTime;
  final TimeOfDay wakeTime;

  const SleepChart({
    super.key,
    required this.bedTime,
    required this.wakeTime,
  });

  List<FlSpot> _getSleepCycleSpots() {
    double bedTimeHour = bedTime.hour + bedTime.minute / 60;
    double wakeTimeHour = wakeTime.hour + wakeTime.minute / 60;
    if (wakeTimeHour < bedTimeHour) {
      wakeTimeHour += 24;
    }

    List<FlSpot> spots = [];

    spots.add(FlSpot(bedTimeHour - 0.5, 0));
    spots.add(FlSpot(bedTimeHour, 1));
    spots.add(FlSpot(bedTimeHour + 0.5, 2));
    spots.add(FlSpot(bedTimeHour + 1.5, 2));
    spots.add(FlSpot(bedTimeHour + 2, 3));
    spots.add(FlSpot(bedTimeHour + 2.5, 3));
    spots.add(FlSpot(bedTimeHour + 3, 2));
    spots.add(FlSpot(bedTimeHour + 4, 2));
    spots.add(FlSpot(bedTimeHour + 4.5, 3));
    spots.add(FlSpot(bedTimeHour + 5, 3));
    spots.add(FlSpot(bedTimeHour + 5.5, 2));
    spots.add(FlSpot(bedTimeHour + 6.5, 2));
    spots.add(FlSpot(bedTimeHour + 7, 3));
    spots.add(FlSpot(bedTimeHour + 7.5, 3));
    spots.add(FlSpot(wakeTimeHour - 0.5, 1));
    spots.add(FlSpot(wakeTimeHour, 0));
    spots.add(FlSpot(wakeTimeHour + 0.5, 0));

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          const Text(
            'Sleep Pattern',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 24,
                minY: 0,
                maxY: 3,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 1,
                  verticalInterval: 4,
                  getDrawingHorizontalLine: (value) => const FlLine(
                    color: Colors.black,
                    strokeWidth: 1,
                  ),
                  getDrawingVerticalLine: (value) => const FlLine(
                    color: Colors.black,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 4,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) return const Text('12 AM');
                        if (value == 4) return const Text('4 AM');
                        if (value == 8) return const Text('8 AM');
                        if (value == 12) return const Text('12 PM');
                        if (value == 16) return const Text('4 PM');
                        if (value == 20) return const Text('8 PM');
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            value.toInt() == 0
                                ? 'Awake'
                                : value.toInt() == 1
                                    ? 'Light'
                                    : value.toInt() == 2
                                        ? 'Deep'
                                        : value.toInt() == 3
                                            ? 'REM'
                                            : '',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        );
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
                    spots: _getSleepCycleSpots(),
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
    );
  }
}
