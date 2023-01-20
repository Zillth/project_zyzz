import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_zyzz/models/api_response.dart';
import 'package:project_zyzz/models/workout.dart';
import 'package:project_zyzz/models/workout_for_listing.dart';
import 'package:project_zyzz/models/workout_insert.dart';
import 'package:project_zyzz/models/workout_update.dart';
import 'package:project_zyzz/services/workout_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddWorkoutsPage extends StatefulWidget {
  @override
  _AddWorkoutsPageState createState() => _AddWorkoutsPageState();
}

class _AddWorkoutsPageState extends State<AddWorkoutsPage> {
  WorkoutService get workoutService => GetIt.I<WorkoutService>();
  late APIResponse<List<WorkoutForListing>> _apiResponse;
  late String errorMessage;
  late Workout? workout;
  String stringTempValue = "Sin datos";
  int intTempValue = 1;

  TextEditingController _workoutVideoController = TextEditingController();

  List<String> videoID = [];
  bool showItem = false;
  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Ejercicios'),
        backgroundColor: const Color(0xffBE95C4),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _workoutVideoController,
              onEditingComplete: () {
                if (utube.hasMatch(_workoutVideoController.text)) {
                  _addItemFuntion();
                } else {
                  FocusScope.of(this.context).unfocus();
                  _workoutVideoController.clear();
                  Flushbar(
                    title: 'Invalid Link',
                    message: 'Please provide a valid link',
                    duration: const Duration(seconds: 3),
                    icon: const Icon(
                      Icons.error_outline,
                      color: Color(0xff5E548E),
                    ),
                  ).show(context);
                }
              },
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  labelText: 'El link del video',
                  suffixIcon: GestureDetector(
                    child: const Icon(Icons.add, size: 32),
                    onTap: () {
                      if (utube.hasMatch(_workoutVideoController.text)) {
                        _addItemFuntion();
                      } else {
                        FocusScope.of(this.context).unfocus();
                        _workoutVideoController.clear();
                        Flushbar(
                          title: 'Invalid Link',
                          message: 'Please provide a valid link',
                          duration: const Duration(seconds: 3),
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.error_outline,
                            color: const Color(0xff5E548E),
                          ),
                        ).show(context);
                      }
                    },
                  )),
            ),
          ),
          Flexible(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                      itemCount: videoID.length,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(8),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                      videoID[index])!,
                                  flags: const YoutubePlayerFlags(
                                    autoPlay: false,
                                  )),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.black,
                              // ignore: prefer_const_constructors
                              progressColors: ProgressBarColors(
                                  playedColor: Colors.black,
                                  handleColor: Colors.black),
                            ),
                          )))),
        ],
      ),
    );
  }

  @override
  void initState() {
    _fetchWorkouts();
    super.initState();
  }

  _fetchWorkouts() async {
    _apiResponse = await workoutService.getWorkoutList();
    for (int i = 0; i < _apiResponse.data!.length; i++) {
      if (!videoID.contains(_apiResponse.data![i].workoutVideo)) {
        videoID.add(_apiResponse.data![i].workoutVideo!);
      }
    }

    if (this.mounted) {
      setState(() {
        videoID.shuffle();
        showItem = true;
      });
    }
  }

  _addItemFuntion() async {
    WorkoutInsert newWorkout = WorkoutInsert(
        workoutName: stringTempValue,
        workoutVideo: _workoutVideoController.text,
        workoutBodyGoal: stringTempValue,
        workoutType: intTempValue);
    final result = await workoutService.createWorkout(newWorkout);
    // ignore: use_build_context_synchronously
    Flushbar(
            title: 'Added',
            message: 'updating...',
            duration: const Duration(seconds: 3),
            icon: const Icon(Icons.info_outline))
        .show(context);
    setState(() {
      videoID.add(_workoutVideoController.text);
    });
    // ignore: use_build_context_synchronously
    FocusScope.of(context).unfocus();
    _workoutVideoController.clear();
  }
}
