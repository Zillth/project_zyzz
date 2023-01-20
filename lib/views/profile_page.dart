import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/user.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/edit_profile_page.dart';
import 'package:project_zyzz/views/main_menu_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserService get userService => GetIt.I<UserService>();

  late String errorMessage;
  User? user;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userSurnameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userAgeController = TextEditingController();
  final TextEditingController _userSexController = TextEditingController();
  final TextEditingController _userPhoneController = TextEditingController();
  final TextEditingController _userAdressController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _userHeightController = TextEditingController();
  final TextEditingController _userWeightController = TextEditingController();

  final TextEditingController _userCoachNameController =
      TextEditingController();

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
      } else {
        _userTypeController.text = 'Entrenador';
      }

      _userCoachNameController.text = 'Sin Asignar';

      _userSurnameController.text =
          'Nombre completo: ${user!.userName!} ${user!.userSurname!}';
      _userEmailController.text = 'Correo Electronico: ${user!.userEmail!}';
      _userAgeController.text = 'Edad: ${user!.userAge!} años';
      _userSexController.text = 'Sexo: ${user!.userSex!}';
      _userPhoneController.text = 'Número telefónico: ${user!.userPhone!}';
      _userAdressController.text = 'Dirección: ${user!.userAdress!}';
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
            child: ColoredBox(
              color: const Color(0xffBE95C4),
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
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                          child: TextField(
                                                            enabled: false,
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                // ignore: prefer_const_constructors
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            controller:
                                                                _userHeightController,
                                                            style: GoogleFonts
                                                                .kanit(
                                                              color:
                                                                  Colors.black,
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
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                          child: TextField(
                                                            enabled: false,
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                // ignore: prefer_const_constructors
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            controller:
                                                                _userWeightController,
                                                            style: GoogleFonts
                                                                .kanit(
                                                              color:
                                                                  Colors.black,
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
                                              'Editar datos',
                                              style: GoogleFonts.kanit(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(const EditProfilePage(),
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
                  //Data part
                  SizedBox(
                    width: screenWidth * 1,
                    height: screenHeight * 0.7,
                    child: Column(
                      children: [
                        //Name
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration:
                                        // ignore: prefer_const_constructors
                                        InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: _userSurnameController,
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Email
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration:
                                        // ignore: prefer_const_constructors
                                        InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: _userEmailController,
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Age
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration:
                                        // ignore: prefer_const_constructors
                                        InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: _userAgeController,
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        //Sex
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration:
                                        // ignore: prefer_const_constructors
                                        InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: _userSexController,
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Number
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration:
                                        // ignore: prefer_const_constructors
                                        InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: _userPhoneController,
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //adress
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration:
                                        // ignore: prefer_const_constructors
                                        InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    controller: _userAdressController,
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                    ),
                                  ),
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 400.0),
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xff231942),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Regresar',
                                  style: GoogleFonts.kanit(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(const MainMenuPage(),
                                  duration: const Duration(seconds: 1),
                                  transition: Transition.fadeIn);
                            },
                          ),
                        ),
                        //End of elemnts
                      ],
                    ),
                  ),

                  //End of elemnts
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
