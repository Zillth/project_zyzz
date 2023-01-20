import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/user_insert.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/login_page.dart';
import 'package:project_zyzz/views/register_page_1.dart';
import 'package:project_zyzz/views/register_page_3.dart';

// ignore: must_be_immutable
class RegisterPage4 extends StatefulWidget {
  UserInsert finalPartOfUser;
  RegisterPage4({Key? key, required this.finalPartOfUser}) : super(key: key);

  @override
  State<RegisterPage4> createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  UserService get userService => GetIt.I<UserService>();
  final TextEditingController _yearsBeingCoachController =
      TextEditingController();

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
                  'GRACIAS POR BAJAR DEL OLIMPO',
                  style: GoogleFonts.kanit(
                    fontSize: 54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '¿Que tan experimentado eres campeón?',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //years being textfield
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
                        controller: _yearsBeingCoachController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Numero de años siendo coach',
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
                          'Listo',
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      widget.finalPartOfUser = UserInsert(
                          userName: widget.finalPartOfUser.userName,
                          userSurname: widget.finalPartOfUser.userSurname,
                          userEmail: widget.finalPartOfUser.userEmail,
                          userPassword: widget.finalPartOfUser.userPassword,
                          userSex: widget.finalPartOfUser.userSex,
                          userAdress: widget.finalPartOfUser.userAdress,
                          userImage: widget.finalPartOfUser.userImage,
                          userAge: widget.finalPartOfUser.userAge,
                          userPhone: widget.finalPartOfUser.userPhone,
                          userHeight: widget.finalPartOfUser.userHeight,
                          userWeight: widget.finalPartOfUser.userWeight,
                          userType: 2,
                          studentsIdList: widget.finalPartOfUser.studentsIdList,
                          yearsBeingCoach:
                              int.parse(_yearsBeingCoachController.text),
                          coachNumberOfStudents:
                              widget.finalPartOfUser.coachNumberOfStudents);

                      final result =
                          await userService.createUser(widget.finalPartOfUser);

                      Get.to(const LoginPage(),
                          duration: const Duration(seconds: 2),
                          transition: Transition.circularReveal);
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            RegisterPage3(
                              thirdPartOfUser: widget.finalPartOfUser,
                            ),
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
