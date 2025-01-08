// lib/features/auth/data/models/user_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
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

  UserDto({
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

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
