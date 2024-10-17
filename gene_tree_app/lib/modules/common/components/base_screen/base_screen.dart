import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    required this.scaffoldBuilder,
    super.key,
  });
  final Widget Function() scaffoldBuilder;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.scaffoldBuilder();
  }
}
