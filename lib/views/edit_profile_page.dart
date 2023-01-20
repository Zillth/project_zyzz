import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_zyzz/models/user.dart';
import 'package:project_zyzz/models/user_update.dart';
import 'package:project_zyzz/services/user_service.dart';
import 'package:project_zyzz/views/login_page.dart';
import 'package:project_zyzz/views/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserService get userService => GetIt.I<UserService>();

  late String errorMessage;
  late User? user;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userAgeController = TextEditingController();
  final TextEditingController _userPhoneController = TextEditingController();
  final TextEditingController _userAdressController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _userHeightController = TextEditingController();
  final TextEditingController _userWeightController = TextEditingController();

  final TextEditingController _userCoachNameController =
      TextEditingController();

  late final String backupSurname;
  late final String backupPassword;
  late final String backupSex;
  late final String backupImage;
  late final int backupType;
  late final String backupStudentsIdList;
  late final int backupYearsBeingCoach;
  late final int backupCoachNumberOfStudents;

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
      _userHeightController.text = user!.userHeight!.toString();
      _userWeightController.text = user!.userWeight!.toString();

      _userEmailController.text = user!.userEmail!;
      _userAgeController.text = user!.userAge!.toString();
      _userPhoneController.text = user!.userPhone!;
      _userAdressController.text = user!.userAdress!;

      if (user!.userType! == 1) {
        _userTypeController.text = 'Aprendiz';
      } else {
        _userTypeController.text = 'Entrenador';
      }

      _userCoachNameController.text = 'Sin Asignar';

      backupSurname = user!.userSurname!;
      backupPassword = user!.userPassword!;
      backupSex = user!.userSex!;
      backupImage = user!.userImage!;
      backupType = user!.userType!;
      backupStudentsIdList = user!.studentsIdList!;
      backupYearsBeingCoach = user!.yearsBeingCoach!;
      backupCoachNumberOfStudents = user!.coachNumberOfStudents!;
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
                                                        TextField(
                                                          controller:
                                                              _userHeightController,
                                                          obscureText: false,
                                                          textAlign:
                                                              TextAlign.center,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'Ingresa nueva estatura',
                                                            hintStyle:
                                                                GoogleFonts
                                                                    .kanit(),
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
                                                        TextField(
                                                          controller:
                                                              _userWeightController,
                                                          obscureText: false,
                                                          textAlign:
                                                              TextAlign.center,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'Ingresa nuevo peso',
                                                            hintStyle:
                                                                GoogleFonts
                                                                    .kanit(),
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
                                        // ignore: prefer_const_constructors
                                        decoration: InputDecoration(
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
                                              'Cancelar',
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
                    height: 15,
                  ),
                  //Data part
                  SizedBox(
                    width: screenWidth * 1,
                    height: screenHeight * 0.7,
                    child: Column(
                      children: [
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
                                child: TextField(
                                  controller: _userEmailController,
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nuevo correo',
                                    hintStyle: GoogleFonts.kanit(),
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
                                child: TextField(
                                  controller: _userAgeController,
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nueva Edad',
                                    hintStyle: GoogleFonts.kanit(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        //Phone
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
                                child: TextField(
                                  controller: _userPhoneController,
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nuevo teléfono',
                                    hintStyle: GoogleFonts.kanit(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Adress
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
                                child: TextField(
                                  controller: _userAdressController,
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nueva dirección',
                                    hintStyle: GoogleFonts.kanit(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Save data
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
                                  'Guardar datos',
                                  style: GoogleFonts.kanit(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              UserUpdate newUser = UserUpdate(
                                  userId: userId,
                                  userName: _userNameController.text,
                                  userSurname: backupSurname,
                                  userEmail: _userEmailController.text,
                                  userPassword: backupPassword,
                                  userSex: backupSex,
                                  userAdress: _userAdressController.text,
                                  userImage: backupImage,
                                  userAge: int.parse(_userAgeController.text),
                                  userPhone: _userPhoneController.text,
                                  userHeight:
                                      double.parse(_userHeightController.text),
                                  userWeight:
                                      double.parse(_userWeightController.text),
                                  userType: backupType,
                                  studentsIdList: backupStudentsIdList,
                                  yearsBeingCoach: backupYearsBeingCoach,
                                  coachNumberOfStudents:
                                      backupCoachNumberOfStudents);

                              final result =
                                  await userService.updateUser(newUser);

                              Get.to(const ProfilePage(),
                                  duration: const Duration(seconds: 1),
                                  transition: Transition.fadeIn);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Delete profile
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
                                  'Eliminar perfil',
                                  style: GoogleFonts.kanit(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              showCupertinoDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text(
                                      '¿Seguro que quieres eliminar la cuenta?'),
                                  // ignore: prefer_const_constructors
                                  content: Text(
                                      'Se eliminarán todos tus datos y ya no podras iniciar sesión'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Get.to(
                                          const EditProfilePage(),
                                          duration: const Duration(seconds: 1),
                                          transition: Transition.fadeIn),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        userService.deleteUser(userId);
                                        FlutterSession().set("userId", 0);

                                        Get.to(const LoginPage(),
                                            duration:
                                                const Duration(seconds: 2),
                                            transition:
                                                Transition.circularReveal);
                                      },
                                      child: const Text('Eliminar'),
                                    ),
                                  ],
                                ),
                              );
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
