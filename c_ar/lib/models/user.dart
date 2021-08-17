class Userr{
  final String uid;
  Userr({required this.uid});
}

class UserData {
  final String uid;
  final String firstName;
  final String lastName;
  final String userLocation;
  final String userEmail;
  final String age;

  UserData(
  {
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.userLocation,
    required this.userEmail,
    required this.age});
}