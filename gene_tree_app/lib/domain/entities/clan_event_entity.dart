// lib/features/auth/data/models/user_model.dart

import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clan_event_entity.g.dart'; // Thêm phần này để liên kết với file .g.dart

@JsonSerializable()
class ClanEventEntity {
  final String? id;
  final ClanEntity? clan;
  final UserEntity? author;
  final String? title;
  final String? description;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  
  @JsonKey(name: "end_date")
  final DateTime? endDate;

  ClanEventEntity({
    this.id,
    this.clan,
    this.author,
    this.title,
    this.description,
    this.createdAt,
    this.startDate,
    this.endDate,
  });

  factory ClanEventEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanEventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClanEventEntityToJson(this);
}
