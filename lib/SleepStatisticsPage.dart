import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'sleep/SleepHeader.dart';
import 'sleep/SleepDateSelector.dart';
import 'sleep/SleepChart.dart';
import 'sleep/TimePicker.dart';
import 'sleep/LogSleepButton.dart';
import 'sleep/CalendarOverlay.dart';
import 'sleep/MetricTile.dart';

class SleepStatisticsPage extends StatefulWidget {
  const SleepStatisticsPage({super.key});

  @override
  _SleepStatisticsPageState createState() => _SleepStatisticsPageState();
}

class _SleepStatisticsPageState extends State<SleepStatisticsPage> {
  TimeOfDay _bedTime = const TimeOfDay(hour: 21, minute: 0); // 9 PM
  TimeOfDay _wakeTime = const TimeOfDay(hour: 5, minute: 30); // 5:30 AM
  DateTime _selectedDate = DateTime.now();
  double _sleepQuality = 70;
  bool _showCalendar = false;
  String? _displayDate;

  @override
  void initState() {
    super.initState();
    _displayDate = DateFormat('EEEE dd-MMM').format(_selectedDate);
  }

  void _updateDisplayDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _displayDate = DateFormat('EEEE dd-MMM').format(date);
      _showCalendar = false;
    });
  }

  void _onPreviousDay() {
    _updateDisplayDate(_selectedDate.subtract(const Duration(days: 1)));
  }

  void _onNextDay() {
    _updateDisplayDate(_selectedDate.add(const Duration(days: 1)));
  }

  Future<void> _selectTime(BuildContext context, bool isBedTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isBedTime ? _bedTime : _wakeTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple[200],
            colorScheme: ColorScheme.light(primary: Colors.purple[200]!),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isBedTime) {
          _bedTime = picked;
        } else {
          _wakeTime = picked;
        }
        _calculateSleepDuration();
      });
    }
  }

  String _calculateSleepDuration() {
    int bedMinutes = _bedTime.hour * 60 + _bedTime.minute;
    int wakeMinutes = _wakeTime.hour * 60 + _wakeTime.minute;

    if (wakeMinutes < bedMinutes) {
      wakeMinutes += 24 * 60;
    }

    int durationMinutes = wakeMinutes - bedMinutes;
    int hours = durationMinutes ~/ 60;
    int minutes = durationMinutes % 60;

    setState(() {
      _sleepQuality = (durationMinutes / (8 * 60)) * 100;
      if (_sleepQuality > 100) _sleepQuality = 100;
    });

    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String duration = _calculateSleepDuration();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SleepHeader(
                  title: 'Sleep Statistics',
                  subtitle: 'Rest Well',
                  onNotificationTap: () {},
                ),
                SizedBox(height: screenWidth * 0.02),
                const SleepDateSelector(), // Moved outside of the Padding
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: const SleepChart(),
                          ),
                          SizedBox(height: screenWidth * 0.04),
                          Column(
                            children: [
                              MetricTile(
                                  title: 'Time to bed',
                                  value: _bedTime.format(context)),
                              MetricTile(
                                  title: 'Sleep Quality',
                                  value:
                                      '${_sleepQuality.toStringAsFixed(1)}%'),
                              MetricTile(
                                  title: 'Sleep Duration', value: duration),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenWidth * 0.04),
                            child: Column(
                              children: [
                                TimePicker(
                                  title: 'Time to Bed',
                                  isBedTime: true,
                                  onSelectTime: () =>
                                      _selectTime(context, true),
                                  time: _bedTime.format(context),
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                TimePicker(
                                  title: 'Wake up Time',
                                  isBedTime: false,
                                  onSelectTime: () =>
                                      _selectTime(context, false),
                                  time: _wakeTime.format(context),
                                ),
                              ],
                            ),
                          ),
                          const LogSleepButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_showCalendar)
              CalendarOverlay(
                selectedDate: _selectedDate,
                onDateChanged: _updateDisplayDate,
                onCancel: () => setState(() => _showCalendar = false),
              ),
          ],
        ),
      ),
    );
  }
}
