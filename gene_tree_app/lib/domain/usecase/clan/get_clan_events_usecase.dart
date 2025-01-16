import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class GetClanEventsUsecase {
  final ClanRepository repo;

  GetClanEventsUsecase(this.repo);

  Future<List<ClanEventEntity>> call(String clanId) async {
    final result = await repo.getClanEventsByClanId(clanId);
    return result.data ?? [];
  }
}
