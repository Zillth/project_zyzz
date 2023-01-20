import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/api_response.dart';
import 'package:project_zyzz/models/user_for_listing.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/main_menu_page.dart';
import 'package:project_zyzz/views/register_page_1.dart';

import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserService get userService => GetIt.I<UserService>();

  late APIResponse<List<UserForListing>> _apiResponse;

  late String errorMessage;
  User? user;

  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  var session = FlutterSession();

  _fetchUsers(String enteredEmail, String enteredPassword) async {
    _apiResponse = await userService.getUserList();

    for (int i = 0; i < _apiResponse.data!.length; i++) {
      if (enteredEmail == _apiResponse.data![i].userEmail) {
        validatePassword(enteredPassword, _apiResponse.data![i].userPassword!,
            _apiResponse.data![i].userId!);
      } else {
        errorMessage = 'Usuario no encontrado';
        showCupertinoDialog<String>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Error al iniciar sesión'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () => Get.to(const LoginPage(),
                    duration: const Duration(seconds: 1),
                    transition: Transition.fadeIn),
                child: const Text('Ok'),
              ),
              TextButton(
                onPressed: () => Get.to(const RegisterPage(),
                    duration: const Duration(seconds: 2),
                    transition: Transition.circularReveal),
                child: const Text('Registrarme'),
              ),
            ],
          ),
        );
      }
    }
  }

  void validatePassword(
      String enteredPassword, String goalPassword, int userId) async {
    if (enteredPassword == goalPassword) {
      await session.set("userId", userId);
      Get.to(const MainMenuPage(),
          duration: const Duration(seconds: 2),
          transition: Transition.circularReveal);
    } else {
      errorMessage = 'Contraseña incorrecta';
      showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Error al iniciar sesión'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.to(const LoginPage(),
                  duration: const Duration(seconds: 1),
                  transition: Transition.fadeIn),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

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
                    width: 250,
                    height: 250,
                    child: Image.asset('lib/images/zyzz_icon.png')),
                // Hello again!
                Text(
                  'HOLA CAMPEÓN',
                  style: GoogleFonts.kanit(
                    fontSize: 54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Bienvenido de vuelta, ¿listo para más ganancias?',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                        obscureText: true,
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
                        'Iniciar Sesión',
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                    ),
                    onTap: () {
                      _fetchUsers(_userEmailController.text,
                          _userPasswordController.text);
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
                      '¿No eres miembro?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const RegisterPage(),
                            duration: const Duration(seconds: 2),
                            transition: Transition.circularReveal);
                      },
                      child: Text(
                        ' Regístrate ahora',
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
