import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/lottie/cp_lottie.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/models/enums/dashboard_enum.dart';
import 'package:gene_tree_app/utils/theme/models/app_theme_model.dart';
import 'package:lottie/lottie.dart';
import './bloc/dashboard_bloc.dart';
part './models/dashboard_argument.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    this.argument,
  });
  final DashboardArgument? argument;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Modular.get<DashboardBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          lazy: false,
          create: (context) => _bloc,
          child: BlocListener<DashboardBloc, DashboardState>(
            listener: (context, state) {
              // TODO: implement listener
              print("Ai debug: ${state.tab}");
            },
            child: BaseScaffold(
              configs: BaseScaffoldConfigs(
                nameScreen: "Dashboard",
                body: (themeState) => Container(),
                bottomNavigationBar: (_) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _.appThemeEnum
                            .themeData()
                            .color
                            .bgColor2
                            .withOpacity(.7),
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: Offset(4, 2),
                      )
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    // buildWhen: (previous, current) => previous.tab != current.tab,
                    builder: (context, state) {
                      return Row(
                        children: [
                          ...DashboardTabEnum.values.map(
                            (_) => _buildNavBarItem(
                              url: _.getIconPath(),
                              isSelected: state.tab == _,
                              onTap: () {
                                _bloc.add(
                                  DashboardEvent.changeTab(_),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavBarItem({
    required String url,
    required bool isSelected,
    required Function onTap,
  }) {
    return Expanded(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.red.withOpacity(0.7) : Colors.black,
          BlendMode.srcATop,
        ),
        child: CPLottie(
          configs: CPLottieConfigs(
            url: url,
            height: 30.h,
            onTap: (controller) {
              onTap();
              controller.forward(from: 0);
            },
          ),
        ),
      ),
    );
  }
}
