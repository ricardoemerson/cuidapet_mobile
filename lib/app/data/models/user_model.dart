import 'dart:convert';

class UserModel {
  final String email;
  final String registerType;
  final String imgAvatar;

  UserModel({
    required this.email,
    required this.registerType,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        registerType = '',
        imgAvatar = '';

  Map<String, dynamic> toMap() => {
        'email': email,
        'register_type': registerType,
        'img_avatar': imgAvatar,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        email: map['email'] ?? '',
        registerType: map['register_type'] ?? '',
        imgAvatar: map['img_avatar'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? email,
    String? registerType,
    String? imgAvatar,
  }) =>
      UserModel(
        email: email ?? this.email,
        registerType: registerType ?? this.registerType,
        imgAvatar: imgAvatar ?? this.imgAvatar,
      );

  @override
  String toString() =>
      'UserModel(email: $email, registerType: $registerType, imgAvatar: $imgAvatar)';
}
