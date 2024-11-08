import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import './bloc/dashboard_bloc.dart';
part './models/dashboard_argument.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    this.argument,
  });
  final DashboardArgument? argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          lazy: false,
          create: (context) => DashboardBloc(),
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Dashboard",
              body: (themeState) => Container(),
            ),
          ),
        );
      },
    );
  }
}
