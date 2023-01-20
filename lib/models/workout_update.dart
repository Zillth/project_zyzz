class WorkoutUpdate {
  int? workoutId;
  String? workoutName;
  String? workoutVideo;
  String? workoutBodyGoal;
  int? workoutType;

  WorkoutUpdate(
      {required this.workoutId,
      required this.workoutName,
      required this.workoutVideo,
      required this.workoutBodyGoal,
      required this.workoutType});

  Map<String, dynamic> toJson() {
    return {
      "workoutId": workoutId,
      "workoutName": workoutName,
      "workoutVideo": workoutVideo,
      "workoutBodyGoal": workoutBodyGoal,
      "workoutType": workoutType
    };
  }
}
