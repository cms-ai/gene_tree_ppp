import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import './bloc/sign_in_bloc.dart';
part './models/sign_in_argument.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
    this.argument,
  });
  final SignInArgument? argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: BlocProvider(
              lazy: false,
              create: (context) => SignInBloc(),
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
