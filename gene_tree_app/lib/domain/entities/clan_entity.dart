import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clan_entity.g.dart';

@JsonSerializable()
class ClanEntity {
  final String id;
  final String? description;
  @JsonKey(name: "clan_name")
  final String? clanName;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  
  final UserEntity? author;
  @JsonKey(name: "clan_code")
  final String? clanCode;

  @JsonKey(name: "members")
  final List<dynamic>? members;

  ClanEntity({
    required this.id,
    this.description,
    this.clanName,
    this.createdAt,
    this.updatedAt,
    required this.author,
    this.clanCode,
    this.members,
  });

  factory ClanEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClanEntityToJson(this);
}
