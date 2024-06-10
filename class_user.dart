class User {
  String userName;
  String firstName;
  String lastName;
  String email;
  String password;
  DateTime dateOfBirth;
  DateTime registrationDate;

  User({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.registrationDate,
  });

  void displayUserInfo() {
    print('User: $firstName $lastName, Email: $email');
  }
}
