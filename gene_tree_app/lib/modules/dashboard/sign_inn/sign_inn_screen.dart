import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import './bloc/sign_inn_bloc.dart';
part './models/sign_inn_argument.dart';

class SignInnScreen extends StatelessWidget {
  const SignInnScreen({
    super.key,
    required this.argument,
  });
  final SignInnArgument argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: BlocProvider(
              lazy: false,
              create: (context) => SignInnBloc(),
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
