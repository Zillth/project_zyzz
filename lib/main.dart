import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:project_zyzz/services/workout_service.dart';
import 'package:project_zyzz/views/login_page.dart';
import 'package:project_zyzz/services/user_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => UserService());
  GetIt.I.registerLazySingleton(() => WorkoutService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
