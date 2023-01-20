class Workout {
  int? workoutId;
  String? workoutName;
  String? workoutVideo;
  String? workoutBodyGoal;
  int? workoutType;

  Workout(
      {this.workoutId,
      this.workoutName,
      this.workoutVideo,
      this.workoutBodyGoal,
      this.workoutType});

  factory Workout.fromJson(Map<String, dynamic> item) {
    return Workout(
      workoutId: item['workoutId'],
      workoutName: item['workoutName'],
      workoutVideo: item['workoutVideo'],
      workoutBodyGoal: item['workoutBodyGoal'],
      workoutType: item['workoutType'],
    );
  }
}
