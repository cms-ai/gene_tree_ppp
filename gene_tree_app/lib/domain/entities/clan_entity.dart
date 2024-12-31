import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clan_entity.g.dart';

@JsonSerializable()
class ClanEntity {
  final String id;
  final String? description;
  final String? clanName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserEntity? author;
  final String? clanCode;

  ClanEntity({
    required this.id,
    this.description,
    this.clanName,
    this.createdAt,
    this.updatedAt,
    required this.author,
    this.clanCode,
  });

  factory ClanEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClanEntityToJson(this);
}
