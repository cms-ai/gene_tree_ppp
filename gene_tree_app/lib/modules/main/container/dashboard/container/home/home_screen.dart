import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import 'package:gene_tree_app/modules/common/components/lottie/cp_lottie.dart';
import './bloc/home_bloc.dart';
part './models/home_argument.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.argument,
  });
  final HomeArgument? argument;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(),
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Home",
              body: (themeState) => _buildBody(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAppbar(),
            _buildClan(),
            SizedBox(height: 20.h),
            _buildEvent(),
          ],
        ),
      ),
    );
  }

  Widget _buildEvent() {
    return Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Event",
              style: themeData.typo.t14Bold.copyWith(
                color: themeData.color.btnColor2,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // TODO: See all event
              },
              child: Text(
                "See all",
                style: themeData.typo.t12Semibold.copyWith(
                  color: themeData.color.btnColor2,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        ...List<Widget>.generate(4, (index) {
          return _buildEventItem();
        })
      ],
    );
  }

  Widget _buildEventItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        gradient: themeData.color.linegradientColor2,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tên sự kiện",
            // textAlign: TextAlign.center,
            style: themeData.typo.t14Bold.copyWith(
              color: themeData.color.btnColor2,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Description: Lorem Ipsum is simply dummy text of the printing and ",
            // textAlign: TextAlign.center,
            style: themeData.typo.t12Regular.copyWith(),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Author: user_name",
                  textAlign: TextAlign.start,
                  style: themeData.typo.t10Regular.copyWith(),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                "18/02/2024",
                textAlign: TextAlign.end,
                style: themeData.typo.t10Regular.copyWith(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildClan() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        gradient: themeData.color.linegradientColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          _buildClanDes(title: "Tên gia tộc: ", content: "Họ trần"),
          SizedBox(height: 8.h),
          _buildClanDes(title: "Thành viên: ", content: "33 member"),
          SizedBox(height: 8.h),
          _buildClanDes(title: "Ngày tạo: ", content: "11/07/2024"),
          SizedBox(height: 16.h),
          CPButton(
            configs: CPButtonConfigs(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              textStyle: themeData.typo.t12Semibold,
              content: "See details",
              onTap: () {
                // TODO: See details clan
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClanDes({
    String? title,
    String? content,
  }) {
    return Row(
      children: [
        Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: themeData.typo.t12Bold.copyWith(),
        ),
        SizedBox(width: 10.w),
        Text(
          content ?? "",
          textAlign: TextAlign.center,
          style: themeData.typo.t12Semibold.copyWith(),
        ),
      ],
    );
  }

  Widget _buildAppbar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: SizedBox(
        height: 40.h,
        child: Row(
          children: [
            CPCmAvatar(
              configs: CPCmAvatarConfigs(
                type: AvatarTypeEnum.network,
                size: 48.h,
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfliKXguR9LkEhnvGQjj1g8sxJpssVQjSIqUaE9urq7DptQmlK0ZlrhB4NtO5LVnRYbNA&usqp=CAU",
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "tcai2000ely@gmail.com",
                    textAlign: TextAlign.center,
                    style: themeData.typo.t14Semibold.copyWith(),
                  ),
                  Text(
                    "Da nang, Viet Nam",
                    textAlign: TextAlign.center,
                    style: themeData.typo.t12Regular.copyWith(),
                  ),
                ],
              ),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                themeData.color.btnColor2,
                BlendMode.srcATop,
              ),
              child: CPLottie(
                configs: CPLottieConfigs(
                  url: Assets.gif.icNotifyDark.path,
                  height: 28.h,
                  onTap: (controller) {
                    // onTap();
                    controller.forward(from: 0);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
