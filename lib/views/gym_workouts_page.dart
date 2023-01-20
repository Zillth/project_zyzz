import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/api_response.dart';
import 'package:project_zyzz/models/workout.dart';
import 'package:project_zyzz/models/workout_for_listing.dart';
import 'package:project_zyzz/models/workout_insert.dart';
import 'package:project_zyzz/models/workout_update.dart';
import 'package:project_zyzz/services/workout_service.dart';
import 'package:project_zyzz/views/main_menu_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GymWorkoutsPage extends StatefulWidget {
  @override
  _GymWorkoutsPageState createState() => _GymWorkoutsPageState();
}

class _GymWorkoutsPageState extends State<GymWorkoutsPage> {
  WorkoutService get workoutService => GetIt.I<WorkoutService>();
  late APIResponse<List<WorkoutForListing>> _apiResponse;
  late String errorMessage;
  late Workout? workout;
  String stringTempValue = "Sin datos";
  int intTempValue = 1;

  List<String> videoID = [];
  bool showItem = false;
  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");

  @override
  void initState() {
    _fetchWorkouts();
    super.initState();
  }

  _fetchWorkouts() async {
    _apiResponse = await workoutService.getWorkoutList();
    for (int i = 0; i < _apiResponse.data!.length; i++) {
      if (!videoID.contains(_apiResponse.data![i].workoutVideo) &&
          _apiResponse.data![i].workoutType == 2) {
        videoID.add(_apiResponse.data![i].workoutVideo!);
      }
    }
    setState(() {
      videoID.shuffle();
      showItem = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios en Gym'),
        backgroundColor: const Color(0xffBE95C4),
        leading: GestureDetector(
          onTap: () {
            Get.to(const MainMenuPage(),
                duration: const Duration(seconds: 1),
                transition: Transition.circularReveal);
          },
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.arrow_back_ios_new, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                // ignore: prefer_const_constructors
                child: Icon(
                  Icons.visibility,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
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
}
