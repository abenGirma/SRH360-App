import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String role;
  final String phoneNumber;
  final DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.role,
    required this.phoneNumber,
    this.createdAt,
  });

  // Factory method to create a UserModel from a Firestore map
  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      name: map['name'],
      role: map['role'],
      phoneNumber: map['phoneNumber'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  // Method to convert a UserModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'role': role,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
    };
  }
}
