class FirebaseUser {
  String name;
  String surname;
  String email;

  FirebaseUser(
      {required this.name, required this.surname, required this.email});

  Map<String, dynamic> getDataMap() {
    return {
      'email': email,
      'name': name,
      'surname': surname,
    };
  }

  String getFullName() {
    return '$name $surname';
  }
}
