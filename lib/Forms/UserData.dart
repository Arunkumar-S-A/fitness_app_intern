class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();
  int currentWeight = 73; // Default weight
  double currentHeight = 172; // Default height
  int targetWeight = 73; // Default target weight
  String activityLevel = ''; // Default activity level
  String gender = ''; // Default gender
  int age = 30; // Default age
  int workoutsPerWeek = 3; // Default workouts per week
  String workoutIntensity = 'moderate'; // Default workout intensity
  double calorieBudget = 2000; // Default calorie budget
  DateTime targetDate =
      DateTime.now().add(const Duration(days: 30)); // Default target date
}
