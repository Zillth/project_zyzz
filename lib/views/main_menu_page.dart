import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/user.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/add_workouts_page.dart';
import 'package:project_zyzz/views/gym_workouts_page.dart';
import 'package:project_zyzz/views/home_workouts_page.dart';
import 'package:project_zyzz/views/login_page.dart';
import 'package:project_zyzz/views/profile_page.dart';

import '../models/api_response.dart';
import '../models/user_for_listing.dart';
import 'add_workout_page.dart';

class MainMenuPage extends StatefulWidget {
  //final int  userId;
  const MainMenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  UserService get userService => GetIt.I<UserService>();

  late String errorMessage;
  User? user;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _userHeightController = TextEditingController();
  final TextEditingController _userWeightController = TextEditingController();

  final TextEditingController _userCoachNameController =
      TextEditingController();

  late bool isCoach;
  String stringTempValue = "value";
  int intTempValue = 1;
  double doubleTempValue = 1.1;

  dynamic userId;

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  _fetchUserData() async {
    userId = await FlutterSession().get("userId");
    userService.getUserById(userId).then((response) {
      if (response.error) {
        errorMessage = response.errorMessage ?? 'An Error occurred';
      }
      user = response.data;
      _userNameController.text = user!.userName!;
      _userHeightController.text = '${user!.userHeight!} cm';
      _userWeightController.text = '${user!.userWeight!} kg';

      if (user!.userType! == 1) {
        _userTypeController.text = 'Aprendiz';
        isCoach = false;
      } else {
        _userTypeController.text = 'Entrenador';
        isCoach = true;
      }

      _userCoachNameController.text = 'Sin Asignar';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Profile part
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SizedBox(
                    width: screenWidth * 1,
                    height: screenHeight * 0.3,
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: screenWidth * 1,
                              height: screenHeight * 0.3,
                              decoration: const BoxDecoration(
                                color: Color(0xffBE95C4),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 150,
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: const Color(0xff5E548E),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(
                                  'lib/images/zyzz_icon.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: screenWidth * 0.33,
                            child: Container(
                              width: screenWidth * 0.33,
                              height: screenHeight * 0.3,
                              decoration: const BoxDecoration(
                                color: Color(0xffBE95C4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    child: TextField(
                                      enabled: false,
                                      controller: _userNameController,
                                      // ignore: prefer_const_constructors
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: GoogleFonts.kanit(
                                        fontSize: 54,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: TextField(
                                      enabled: false,
                                      // ignore: prefer_const_constructors
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      controller: _userTypeController,
                                      style: GoogleFonts.kanit(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: 500,
                                      height: 75,
                                      child: Center(
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                width: 200,
                                                height: 75,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE0B1CB),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                        child: TextField(
                                                          enabled: false,
                                                          textAlign:
                                                              TextAlign.center,
                                                          decoration:
                                                              // ignore: prefer_const_constructors
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          controller:
                                                              _userHeightController,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Estatura',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Container(
                                                width: 200,
                                                height: 75,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE0B1CB),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                        child: TextField(
                                                          enabled: false,
                                                          textAlign:
                                                              TextAlign.center,
                                                          decoration:
                                                              // ignore: prefer_const_constructors
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          controller:
                                                              _userWeightController,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Peso',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: screenWidth * 0.34,
                              height: screenHeight * 0.3,
                              decoration: const BoxDecoration(
                                color: Color(0xffBE95C4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    'Entrenador:',
                                    style: GoogleFonts.kanit(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: TextField(
                                      enabled: false,
                                      decoration:
                                          // ignore: prefer_const_constructors
                                          InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      controller: _userCoachNameController,
                                      style: GoogleFonts.kanit(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: InkWell(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff231942),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Mi perfil',
                                            style: GoogleFonts.kanit(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Get.to(const ProfilePage(),
                                            duration:
                                                const Duration(seconds: 1),
                                            transition: Transition.fadeIn);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //Menu part
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 300.0),
                  child: SizedBox(
                    width: screenWidth * 1,
                    height: screenHeight * 0.7,
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    width: 275,
                                    height: 55,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff231942),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Ejercicios en Gimnasio',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(GymWorkoutsPage(),
                                        duration: const Duration(seconds: 1),
                                        transition: Transition.circularReveal);
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  child: Container(
                                    width: 275,
                                    height: 55,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff231942),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Agregar ejercicios',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(const AddWorkoutPage(),
                                        duration: const Duration(seconds: 1),
                                        transition: Transition.circularReveal);
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  child: Container(
                                    width: 275,
                                    height: 55,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff231942),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Entrenadores',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(const MainMenuPage(),
                                        duration: const Duration(seconds: 2),
                                        transition: Transition.circularReveal);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    width: 275,
                                    height: 55,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff231942),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Ejercicios en casa',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(HomeWorkoutsPage(),
                                        duration: const Duration(seconds: 2),
                                        transition: Transition.circularReveal);
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  child: Container(
                                    width: 275,
                                    height: 55,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff231942),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Mi entrenador',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(const MainMenuPage(),
                                        duration: const Duration(seconds: 2),
                                        transition: Transition.circularReveal);
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  child: Container(
                                    width: 275,
                                    height: 55,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff231942),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Cerrar sesion',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(const LoginPage(),
                                        duration: const Duration(seconds: 2),
                                        transition: Transition.circularReveal);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //End of elemnts
              ],
            ),
          ),
        ),
      ),
    );
  }
}
