import 'package:gene_tree_app/gen/assets.gen.dart';

enum DashboardTabEnum {
  home,
  // library,
  clan,
  notify,
  profile,
}

extension DashboardEnumExt on DashboardTabEnum {
  String getIconPath() {
    switch (this) {
      case DashboardTabEnum.home:
        return Assets.gif.icHomeDark;
      // case DashboardTabEnum.library:
      //   return Assets.gif.icChatDark;
      case DashboardTabEnum.clan:
        return Assets.gif.icGeneDark;
      case DashboardTabEnum.notify:
        return Assets.gif.icNotifyDark;
      case DashboardTabEnum.profile:
        return Assets.gif.icProfileDark;
    }
  }
}
