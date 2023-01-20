import 'dart:convert';

import 'package:project_zyzz/models/api_response.dart';
import 'package:project_zyzz/models/workout.dart';
import 'package:project_zyzz/models/workout_for_listing.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:project_zyzz/models/workout_insert.dart';
import 'package:project_zyzz/models/workout_update.dart';

class WorkoutService {
  static const api = 'https://2cae-148-204-56-40.ngrok.io';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<List<WorkoutForListing>>> getWorkoutList() {
    return http.get(Uri.parse('$api/workout'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final workouts = <WorkoutForListing>[];
        for (var item in jsonData) {
          workouts.add(WorkoutForListing.fromJson(item));
        }
        return APIResponse<List<WorkoutForListing>>(data: workouts);
      }
      return APIResponse<List<WorkoutForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<WorkoutForListing>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Workout>> getWorkoutById(int workoutId) {
    return http
        .get(Uri.parse('$api/workout/$workoutId'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Workout>(data: Workout.fromJson(jsonData));
      }
      return APIResponse<Workout>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Workout>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createWorkout(WorkoutInsert item) {
    return http
        .post(Uri.parse('$api/workout'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            // ignore: invalid_return_type_for_catch_error
            APIResponse<Workout>(
                error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateWorkout(WorkoutUpdate item) {
    return http
        .post(Uri.parse('$api/workout'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            // ignore: invalid_return_type_for_catch_error
            APIResponse<Workout>(
                error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deleteWorkout(int workoutId) {
    return http
        .delete('$api/workout/$workoutId', headers: headers)
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
