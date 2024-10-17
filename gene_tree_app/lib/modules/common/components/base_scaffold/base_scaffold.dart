import 'package:flutter/material.dart';

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
    return Scaffold(
      body: widget.configs.body,
    );
  }
}
