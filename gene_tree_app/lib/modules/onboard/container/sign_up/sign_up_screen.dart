import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import './bloc/sign_up_bloc.dart';
part './models/sign_up_argument.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
    this.argument,
  });
  final SignUpArgument? argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: BlocProvider(
              lazy: false,
              create: (context) => SignUpBloc(),
              child: Container(
                child: Center(
                    child: GestureDetector(
                        onTap: () {
                          print("==== ${Modular.to.path}");
                          Modular.to.navigate(
                              "/onboard" + OnboardModuleEnum.signIn.path);
                        },
                        child: Text("Sign in"))),
              ),
            ),
          ),
        );
      },
    );
  }
}
