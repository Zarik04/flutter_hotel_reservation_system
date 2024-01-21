class Guest {
  final String firstName,
      lastName,
      email,
      passportNumber,
      birthDate,
      phone,
      password;
  String? imagePath;

  Guest(
      {required this.firstName,
      required this.lastName,
      this.imagePath,
      required this.email,
      required this.passportNumber,
      required this.birthDate,
      required this.phone,
      required this.password});
}
