class WorkoutInsert {
  String? workoutName;
  String? workoutVideo;
  String? workoutBodyGoal;
  int? workoutType;

  WorkoutInsert(
      {required this.workoutName,
      required this.workoutVideo,
      required this.workoutBodyGoal,
      required this.workoutType});

  Map<String, dynamic> toJson() {
    return {
      "workoutName": workoutName,
      "workoutVideo": workoutVideo,
      "workoutBodyGoal": workoutBodyGoal,
      "workoutType": workoutType
    };
  }
}
