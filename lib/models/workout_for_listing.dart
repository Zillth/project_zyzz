class WorkoutForListing {
  int? workoutId;
  String? workoutName;
  String? workoutVideo;
  String? workoutBodyGoal;
  int? workoutType;

  WorkoutForListing(
      {this.workoutId,
      this.workoutName,
      this.workoutVideo,
      this.workoutBodyGoal,
      this.workoutType});

  factory WorkoutForListing.fromJson(Map<String, dynamic> item) {
    return WorkoutForListing(
      workoutId: item['workoutId'],
      workoutName: item['workoutName'],
      workoutVideo: item['workoutVideo'],
      workoutBodyGoal: item['workoutBodyGoal'],
      workoutType: item['workoutType'],
    );
  }
}
