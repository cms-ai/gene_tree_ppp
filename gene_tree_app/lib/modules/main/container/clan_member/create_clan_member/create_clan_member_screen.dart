import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import './bloc/create_clan_member_bloc.dart';
part './models/create_clan_member_argument.dart';

class CreateClanMemberScreen extends StatelessWidget {
  const CreateClanMemberScreen({
    super.key,
    this.argument,
  });
  final CreateClanMemberArgument? argument;

  @override
  Widget build(BuildContext context) {
    final CreateClanMemberBloc bloc = Modular.get<CreateClanMemberBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider(
          create: (context) => bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "CreateClanMember",
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Create member",
                ),
              ),
              body: (themeState) => Container(
                child: Text("CreateClanMemberScreen"),
              ),
            ),
          ),
        );
      },
    );
  }
}
