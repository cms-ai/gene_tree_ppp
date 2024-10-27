import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import './bloc/welcome_bloc.dart';
part './models/welcome_argument.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
    this.argument,
  });
  final WelcomeArgument? argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: BlocProvider(
              lazy: false,
              create: (context) => WelcomeBloc(),
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
