class UserUpdate {
  int userId;
  String userName;
  String userSurname;
  String userEmail;
  String userPassword;
  String userSex;
  String userAdress;
  String userImage;
  int userAge;
  String userPhone;
  double userHeight;
  double userWeight;
  int userType;

  String studentsIdList;
  int yearsBeingCoach;
  int coachNumberOfStudents;

  UserUpdate(
      {required this.userId,
      required this.userName,
      required this.userSurname,
      required this.userEmail,
      required this.userPassword,
      required this.userSex,
      required this.userAdress,
      required this.userImage,
      required this.userAge,
      required this.userPhone,
      required this.userHeight,
      required this.userWeight,
      required this.userType,
      required this.studentsIdList,
      required this.yearsBeingCoach,
      required this.coachNumberOfStudents});

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "userSurname": userSurname,
      "userEmail": userEmail,
      "userPassword": userPassword,
      "userSex": userSex,
      "userAdress": userAdress,
      "userImage": userImage,
      "userAge": userAge,
      "userPhone": userPhone,
      "userHeight": userHeight,
      "userWeight": userWeight,
      "userType": userType,
      "studentsIdList": studentsIdList,
      "yearsBeingCoach": yearsBeingCoach,
      "coachNumberOfStudents": coachNumberOfStudents
    };
  }
}
