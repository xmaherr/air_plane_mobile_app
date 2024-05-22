import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final List<String> bookings;
  static UserModel? currentUser;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.bookings,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      bookings: List<String>.from(json['bookings']), gender: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'bookings': bookings,
    };
  }

  static void setCurrentUser(UserModel user) {
    currentUser = user;
  }
}
