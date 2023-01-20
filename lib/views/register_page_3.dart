import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/register_page_2.dart';
import 'package:project_zyzz/views/register_page_4.dart';

import '../models/user_insert.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class RegisterPage3 extends StatefulWidget {
  UserInsert thirdPartOfUser;
  RegisterPage3({Key? key, required this.thirdPartOfUser}) : super(key: key);

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  UserService get userService => GetIt.I<UserService>();
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
                  'DEFINE TU CAMINO',
                  style: GoogleFonts.kanit(
                    fontSize: 54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '¿Quieres aprender o quieres enseñar?',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //Master or apprentice
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: SizedBox(
                    width: 800,
                    height: 55,
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: InkWell(
                              child: Container(
                                width: 275,
                                height: 55,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'Soy aprendiz',
                                    style: GoogleFonts.kanit(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                widget.thirdPartOfUser = UserInsert(
                                    userName: widget.thirdPartOfUser.userName,
                                    userSurname:
                                        widget.thirdPartOfUser.userSurname,
                                    userEmail: widget.thirdPartOfUser.userEmail,
                                    userPassword:
                                        widget.thirdPartOfUser.userPassword,
                                    userSex: widget.thirdPartOfUser.userSex,
                                    userAdress:
                                        widget.thirdPartOfUser.userAdress,
                                    userImage: widget.thirdPartOfUser.userImage,
                                    userAge: widget.thirdPartOfUser.userAge,
                                    userPhone: widget.thirdPartOfUser.userPhone,
                                    userHeight:
                                        widget.thirdPartOfUser.userHeight,
                                    userWeight:
                                        widget.thirdPartOfUser.userWeight,
                                    userType: 1,
                                    studentsIdList:
                                        widget.thirdPartOfUser.studentsIdList,
                                    yearsBeingCoach:
                                        widget.thirdPartOfUser.yearsBeingCoach,
                                    coachNumberOfStudents: widget
                                        .thirdPartOfUser.coachNumberOfStudents);

                                final result = await userService
                                    .createUser(widget.thirdPartOfUser);

                                Get.to(const LoginPage(),
                                    duration: const Duration(seconds: 2),
                                    transition: Transition.circularReveal);
                              },
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              child: Container(
                                width: 275,
                                height: 55,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'Soy entrenador',
                                    style: GoogleFonts.kanit(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                widget.thirdPartOfUser = UserInsert(
                                    userName: widget.thirdPartOfUser.userName,
                                    userSurname:
                                        widget.thirdPartOfUser.userSurname,
                                    userEmail: widget.thirdPartOfUser.userEmail,
                                    userPassword:
                                        widget.thirdPartOfUser.userPassword,
                                    userSex: widget.thirdPartOfUser.userSex,
                                    userAdress:
                                        widget.thirdPartOfUser.userAdress,
                                    userImage: widget.thirdPartOfUser.userImage,
                                    userAge: widget.thirdPartOfUser.userAge,
                                    userPhone: widget.thirdPartOfUser.userPhone,
                                    userHeight:
                                        widget.thirdPartOfUser.userHeight,
                                    userWeight:
                                        widget.thirdPartOfUser.userWeight,
                                    userType: 2,
                                    studentsIdList:
                                        widget.thirdPartOfUser.studentsIdList,
                                    yearsBeingCoach:
                                        widget.thirdPartOfUser.yearsBeingCoach,
                                    coachNumberOfStudents: widget
                                        .thirdPartOfUser.coachNumberOfStudents);

                                Get.to(
                                    RegisterPage4(
                                        finalPartOfUser:
                                            widget.thirdPartOfUser),
                                    duration: const Duration(seconds: 2),
                                    transition: Transition.circularReveal);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ), //SizedBox
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            RegisterPage2(
                                secondPartOfUser: widget.thirdPartOfUser),
                            duration: const Duration(seconds: 2),
                            transition: Transition.circularReveal);
                      },
                      child: Text(
                        'Regresar',
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
