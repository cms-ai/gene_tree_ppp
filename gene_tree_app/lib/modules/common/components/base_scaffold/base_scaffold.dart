import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/utils/theme/models/app_theme_model.dart';

part 'base_scaffold_configs.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({
    super.key,
    required this.configs,
  });
  final BaseScaffoldConfigs configs;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.appThemeEnum.themeData().theme.colorScheme.background,
          body: widget.configs.body,
          bottomNavigationBar: widget.configs.bottomNavigationBar,
        );
      },
    );
  }
}
