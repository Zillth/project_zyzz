import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/user.dart';
import 'package:project_zyzz/models/user_insert.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/login_page.dart';
import 'package:project_zyzz/views/register_page_2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserService get userService => GetIt.I<UserService>();

  late User? user;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userSurnameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userAgeController = TextEditingController();
  final TextEditingController _userSexController = TextEditingController();

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
                  'EMPIEZA TU LEYENDA',
                  style: GoogleFonts.kanit(
                    fontSize: 54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Abraza la masculinidad, rechaza la degeneración',
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
                        controller: _userNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombres',
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
                        controller: _userSurnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Apellidos',
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
                        controller: _userEmailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Correo electrónico',
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
                        controller: _userPasswordController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                          hintStyle: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Age and Sex
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
                                  controller: _userAgeController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Edad',
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
                                  controller: _userSexController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Sexo',
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
                      UserInsert firstPartOfUser = UserInsert(
                          userName: _userNameController.text,
                          userSurname: _userSurnameController.text,
                          userEmail: _userEmailController.text,
                          userPassword: _userPasswordController.text,
                          userSex: _userSexController.text,
                          userAdress: stringTempValue,
                          userImage: stringTempValue,
                          userAge: int.parse(_userAgeController.text),
                          userPhone: stringTempValue,
                          userHeight: doubleTempValue,
                          userWeight: doubleTempValue,
                          userType: intTempValue,
                          studentsIdList: stringTempValue,
                          yearsBeingCoach: intTempValue,
                          coachNumberOfStudents: intTempValue);

                      Get.to(RegisterPage2(secondPartOfUser: firstPartOfUser),
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
                    const Text(
                      '¿Ya eres miembro?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const LoginPage(),
                            duration: const Duration(seconds: 2),
                            transition: Transition.circularReveal);
                      },
                      child: Text(
                        ' Inicia sesión',
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
