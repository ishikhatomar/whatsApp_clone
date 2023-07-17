import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String uid;
  final String profileImageUrl;
  final bool active;
  final int lastSeen;
  final String phoneNumber;
  final List<String> groupId;

  UserModel( {
   required this.lastSeen,
    required this.username,
    required this.uid,
    required this.profileImageUrl,
    required this.active,
    required this.phoneNumber,
    required this.groupId,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "profileImageUrl": profileImageUrl,
        "active": active,
        "lastSeen": lastSeen,
        "phoneNumber": phoneNumber,
        "groupId": groupId
      };

  static UserModel fromSnap(Map<String, dynamic> data) {
     
    return UserModel(
        username: data['username'] ?? "",
        uid: data['uid'] ?? "",
        lastSeen: data['lastSeen'] ?? 0,
        profileImageUrl: data['profileImageUrl'] ?? "",
        active: data['active'] ?? false,
        phoneNumber: data['phoneNumber'] ?? "",
        groupId: ((data['groupId'] ?? []) as List).cast<String>(),
    );
  }
}
