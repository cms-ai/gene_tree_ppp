import 'package:flutter/material.dart';
import 'package:gene_tree_app/modules/common/l10n/generated/l10n.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(CommonLocalizations.current.test);
  }
}
