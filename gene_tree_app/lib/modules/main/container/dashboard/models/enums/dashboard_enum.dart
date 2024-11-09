import 'package:gene_tree_app/gen/assets.gen.dart';

enum DashboardTabEnum {
  home,
  event,
  geneTree,
  member,
  profile,
}

extension DashboardEnumExt on DashboardTabEnum {
  String getIconPath() {
    switch (this) {
      case DashboardTabEnum.home:
        return Assets.gif.icHomeDark.path;
      case DashboardTabEnum.event:
        return Assets.gif.icCalendar.path;
      case DashboardTabEnum.geneTree:
        return Assets.gif.icGeneDark.path;
      case DashboardTabEnum.member:
        return Assets.gif.icMember.path;
      case DashboardTabEnum.profile:
        return Assets.gif.icProfileDark.path;
    }
  }
}
