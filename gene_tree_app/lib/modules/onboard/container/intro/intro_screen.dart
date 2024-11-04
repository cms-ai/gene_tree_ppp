import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
import './bloc/intro_bloc.dart';
part './models/intro_argument.dart';
part './models/intro_item_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    super.key,
    this.argument,
  });
  final IntroArgument? argument;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  final itemList = [
    IntroItemModel(
      image: Assets.images.onboarding1.image(),
      title: OnboardLocalizations.current.familyOriginTitle,
      sub: OnboardLocalizations.current.familyOriginContent,
    ),
    IntroItemModel(
      image: Assets.images.onboarding2.image(),
      title: OnboardLocalizations.current.familyTraditionTitle,
      sub: OnboardLocalizations.current.familyTraditionContent,
    ),
    IntroItemModel(
      image: Assets.images.onboarding1.image(),
      title: OnboardLocalizations.current.familyFutureTitle,
      sub: OnboardLocalizations.current.familyFutureContent,
    ),
  ];
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Intro",
            body: BlocProvider(
              lazy: false,
              create: (context) => IntroBloc(),
              child: PageView.builder(
                controller: controller,
                itemCount: itemList.length,
                onPageChanged: (value) {},
                itemBuilder: (context, index) {
                  return _buildPageViewItem(
                    itemList[index],
                    index,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// ======= Build method list ==========
  ///
  Widget _buildPageViewItem(
    IntroItemModel data,
    int index,
  ) {
    return SizedBox(
      key: ValueKey(index),
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: data.image,
          ),
          Text(
            data.title,
            style: themeData.typo.t14Bold,
          ),
          Text(
            data.sub,
            style: themeData.typo.t14Bold,
          )
        ],
      ),
    );
  }
}
