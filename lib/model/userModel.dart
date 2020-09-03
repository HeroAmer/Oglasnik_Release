class User {
  String fullName, userID, phoneNumber, password, email;
  User(
      {this.fullName,
      this.userID,
      this.phoneNumber,
      this.password,
      this.email});

  factory User.fromDocument(Map data) {
    return User(
      fullName: data['fullName'],
      userID: data['userID'],
      phoneNumber: data['phoneNumber'],
      password: data['password'],
      email: data['email'],
    );
  }
  Map<String, dynamic> toJson() =>
      {"uid": userID, "email": email, "name": fullName, "password": password};
}
