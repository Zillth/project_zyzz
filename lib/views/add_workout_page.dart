import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/workout.dart';
import 'package:project_zyzz/models/workout_insert.dart';
import 'package:project_zyzz/services/workout_service.dart';
import 'package:project_zyzz/views/login_page.dart';
import 'package:project_zyzz/views/main_menu_page.dart';
import 'package:project_zyzz/views/register_page_2.dart';
import 'package:project_zyzz/views/update_workout_page.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  WorkoutService get workoutService => GetIt.I<WorkoutService>();

  late Workout? user;

  final TextEditingController _workoutNameController = TextEditingController();
  final TextEditingController _workoutBodyGoalController =
      TextEditingController();
  final TextEditingController _workoutTypeController = TextEditingController();
  final TextEditingController _workoutVideoController = TextEditingController();

  String stringTempValue = "value";
  int intTempValue = 1;
  double doubleTempValue = 1.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('lib/images/zyzz_icon.png')),
                // Hello again!
                Text(
                  'TÚ HACES EL CAMBIO',
                  style: GoogleFonts.kanit(
                    fontSize: 54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Gracias por tomarte el tiempo de agregar más conocimiento',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _workoutNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombre del Ejercicio',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //surename textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _workoutBodyGoalController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Parte del cuerpo que se trabaja',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _workoutTypeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '¿Casa o Gym?',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _workoutVideoController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enlace del video',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ), //SizedBox
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Agregar',
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (_workoutTypeController.text == 'casa') {
                        intTempValue = 1;
                      } else {
                        intTempValue = 2;
                      }

                      WorkoutInsert newWorkout = WorkoutInsert(
                        workoutName: _workoutNameController.text,
                        workoutBodyGoal: _workoutBodyGoalController.text,
                        workoutType: intTempValue,
                        workoutVideo: _workoutVideoController.text,
                      );

                      final result =
                          await workoutService.createWorkout(newWorkout);
                      Get.to(const MainMenuPage(),
                          duration: const Duration(seconds: 2),
                          transition: Transition.circularReveal);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ), //SizedBox
                //Update button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Editar existente',
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      Get.to(const UpdateWorkoutPage(),
                          duration: const Duration(seconds: 2),
                          transition: Transition.circularReveal);
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
