class UserForListing {
  int? userId;
  String? userName;
  String? userSurname;
  String? userEmail;
  String? userPassword;
  String? userSex;
  String? userAdress;
  String? userImage;
  int? userAge;
  String? userPhone;
  double? userHeight;
  double? userWeight;
  int? userType;

  String? studentsIdList;
  int? yearsBeingCoach;
  int? coachNumberOfStudents;

  UserForListing(
      {this.userId,
      this.userName,
      this.userSurname,
      this.userEmail,
      this.userPassword,
      this.userSex,
      this.userAdress,
      this.userImage,
      this.userAge,
      this.userPhone,
      this.userHeight,
      this.userWeight,
      this.userType,
      this.studentsIdList,
      this.yearsBeingCoach,
      this.coachNumberOfStudents});

  factory UserForListing.fromJson(Map<String, dynamic> item) {
    return UserForListing(
      userId: item['userId'],
      userName: item['userName'],
      userSurname: item['userSurname'],
      userEmail: item['userEmail'],
      userPassword: item['userPassword'],
      userSex: item['userSex'],
      userAdress: item['userAdress'],
      userImage: item['userImage'],
      userAge: item['userAge'],
      userPhone: item['userPhone'],
      userHeight: item['userHeight'],
      userWeight: item['userWeight'],
      userType: item['userType'],
      studentsIdList: item['studentsIdList'],
      yearsBeingCoach: item['yearsBeingCoach'],
      coachNumberOfStudents: item['coachNumberOfStudents'],
    );
  }
}
