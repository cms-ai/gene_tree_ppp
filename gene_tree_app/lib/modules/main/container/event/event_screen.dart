import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import './bloc/event_bloc.dart';
part './models/event_argument.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    super.key,
    this.argument,
  });
  final EventArgument? argument;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> bodyWidgetList = [
      _buildEventTodayList(),
    ];
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          lazy: false,
          create: (context) => EventBloc(),
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Event",
              body: (themeState) => Column(
                children: [
                  _buildHeader(themeState),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bodyWidgetList.length,
                      itemBuilder: (context, index) => bodyWidgetList[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

extension _EventScreenStateExt on _EventScreenState {
  ///
  /// Header
  ///
  Widget _buildHeader(ThemeState themeState) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            themeState.appThemeEnum.themeData().spacing.screenHorizontal,
        vertical: themeState.appThemeEnum.themeData().spacing.screenVertical,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Event",
            style: themeState.appThemeEnum.themeData().typo.tHeader.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Container(
            padding: EdgeInsets.all(
              themeState.appThemeEnum.themeData().spacing.s6,
            ),
            decoration: BoxDecoration(
              color: themeState.appThemeEnum
                  .themeData()
                  .color
                  .bgColor2
                  .withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Icon(
                  Icons.filter_list_outlined,
                  size: 18.h,
                ),
                Positioned(
                  right: 0,
                  top: 2,
                  child: Container(
                    width: 5.h,
                    height: 5.h,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ///
  /// event today widget
  ///

  Widget _buildEventTodayList() {
    return Container();
  }
}
