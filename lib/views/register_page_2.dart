import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/user_insert.dart';
import 'package:project_zyzz/views/register_page_1.dart';
import 'package:project_zyzz/views/register_page_3.dart';

// ignore: must_be_immutable
class RegisterPage2 extends StatefulWidget {
  UserInsert secondPartOfUser;
  RegisterPage2({Key? key, required this.secondPartOfUser}) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final TextEditingController _userPhoneController = TextEditingController();
  final TextEditingController _userAdressController = TextEditingController();
  final TextEditingController _userHeightController = TextEditingController();
  final TextEditingController _userWeightController = TextEditingController();

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
                  'CONVIERTETE EN UN TITÁN',
                  style: GoogleFonts.kanit(
                    fontSize: 54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Necesitamos unos datos más para terminar tu registro',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //phone textfield
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
                        controller: _userPhoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Número telefónico',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //adress textfield
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
                        controller: _userAdressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Dirección',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //height and weight textfield
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
                            child: Container(
                              width: 275,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: _userHeightController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Estatura',
                                    hintStyle: GoogleFonts.kanit(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 275,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: _userWeightController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Peso',
                                    hintStyle: GoogleFonts.kanit(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          'Siguiente',
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      widget.secondPartOfUser = UserInsert(
                          userName: widget.secondPartOfUser.userName,
                          userSurname: widget.secondPartOfUser.userSurname,
                          userEmail: widget.secondPartOfUser.userEmail,
                          userPassword: widget.secondPartOfUser.userPassword,
                          userSex: widget.secondPartOfUser.userSex,
                          userAdress: _userAdressController.text,
                          userImage: widget.secondPartOfUser.userImage,
                          userAge: widget.secondPartOfUser.userAge,
                          userPhone: _userPhoneController.text,
                          userHeight: double.parse(_userHeightController.text),
                          userWeight: double.parse(_userWeightController.text),
                          userType: widget.secondPartOfUser.userType,
                          studentsIdList:
                              widget.secondPartOfUser.studentsIdList,
                          yearsBeingCoach:
                              widget.secondPartOfUser.yearsBeingCoach,
                          coachNumberOfStudents:
                              widget.secondPartOfUser.coachNumberOfStudents);

                      Get.to(
                          RegisterPage3(
                              thirdPartOfUser: widget.secondPartOfUser),
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
                        Get.to(const RegisterPage(),
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
