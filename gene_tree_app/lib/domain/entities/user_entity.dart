// lib/features/auth/data/models/user_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart'; // Thêm phần này để liên kết với file .g.dart

@JsonSerializable()
class UserEntity {
  final String? userId;
  final String? userName;
  final String? fullName;
  final String? description;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? dob;
  final String? gender;
  final String? lastLogin;
  final String? avatarUrl;
  final String? refreshToken;
  final bool? isDeleted;
  final bool? isVerified;

  UserEntity({
    this.userId,
    this.userName,
    this.fullName,
    this.description,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.dob,
    this.gender,
    this.lastLogin,
    this.avatarUrl,
    this.refreshToken,
    this.isDeleted,
    this.isVerified,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
