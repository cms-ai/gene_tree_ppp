import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import 'package:gene_tree_app/modules/main/container/clan/update_clan/update_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan_member/clan_member_list/clan_member_list_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/event/event_screen.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import './bloc/clan_detail_bloc.dart';
part './models/clan_detail_argument.dart';

class ClanDetailScreen extends StatelessWidget {
  const ClanDetailScreen({
    super.key,
    this.argument,
  });
  final ClanDetailArgument? argument;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      _buildClanOption(title: "Cõi vĩnh hằng", onTap: () {}),
      _buildClanOption(
          title: "Thành viên",
          onTap: () {
            Modular.to.pushNamed(
              MainModule.getRoutePath(MainModuleEnum.clanMemberList),
              arguments: ClanMemberListArgument(
                clanId: argument?.clanEntity?.id ?? "",
              ),
            );
          }),
      _buildClanOption(title: "Bảng vàng", onTap: () {}),
      _buildClanOption(title: "Sự kiện", onTap: () {}),
      _buildClanOption(title: "Công đức", onTap: () {}),
      _buildClanOption(title: "Thu chi", onTap: () {}),
    ];

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          create: (context) => ClanDetailBloc(),
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "ClanDetail",
              appBar: CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Clan detail",
                  suffixWidget: argument?.clanEntity != null
                      ? GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(
                              MainModule.getRoutePath(
                                  MainModuleEnum.updateClan),
                              arguments: UpdateClanArgument(
                                clanEntity: argument!.clanEntity!,
                              ),
                            );
                          },
                          child: const Icon(Icons.edit_rounded))
                      : Container(),
                ),
              ),
              body: (themeState) => Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.spacing.screenHorizontal,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.clan.image(height: 60.h),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Gia tộc ${argument?.clanEntity?.clanName}",
                      textAlign: TextAlign.center,
                      style: themeData.typo.t12Bold.copyWith(),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              gradient: themeData.color.linegradientColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Ngày tạo",
                                  textAlign: TextAlign.center,
                                  style: themeData.typo.t12Bold.copyWith(
                                    color: themeData.color.btnColor2,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  DateTimeHelper.formatDateTime(
                                    argument?.clanEntity?.createdAt ??
                                        DateTime.now(),
                                    format: "dd/MM/yyyy",
                                  ),
                                  textAlign: TextAlign.center,
                                  style: themeData.typo.t12Regular.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              gradient: themeData.color.linegradientColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Author",
                                  textAlign: TextAlign.center,
                                  style: themeData.typo.t12Bold.copyWith(
                                    color: themeData.color.btnColor2,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  argument?.clanEntity?.author?.fullName ?? "",
                                  textAlign: TextAlign.center,
                                  style: themeData.typo.t12Regular.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Số cột là 3
                          crossAxisSpacing: 10, // Khoảng cách giữa các cột
                          mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                          mainAxisExtent: 60.h,
                        ),
                        itemCount: items.length,
                        primary: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return items[index];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildClanOption({
    required String title,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: themeData.color.btnColor2.withOpacity(.7),
          gradient: themeData.color.linegradientColor2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: themeData.typo.t10Semibold,
        ),
      ),
    );
  }
}
