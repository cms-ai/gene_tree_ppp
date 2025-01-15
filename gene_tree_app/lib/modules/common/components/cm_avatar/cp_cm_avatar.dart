import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
part './models/cp_cm_avatar_configs.dart';

class CPCmAvatar extends StatelessWidget {
  const CPCmAvatar({
    super.key,
    required this.configs,
  });
  final CPCmAvatarConfigs configs;
  @override
  Widget build(BuildContext context) {
    // final  themeBloc = Modular.get<ThemeBloc>();
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: themeData.color.btnColor2, width: 2),
      ),
      child: Container(
        width: configs.size,
        height: configs.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: configs.imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(configs.imageUrl ?? ""),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
