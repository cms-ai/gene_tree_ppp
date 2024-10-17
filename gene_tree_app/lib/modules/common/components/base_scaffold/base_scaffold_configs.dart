part of 'base_scaffold.dart';

class BaseScaffoldConfigs {
  const BaseScaffoldConfigs({
    required this.nameScreen,
    required this.body,
  });
  final String nameScreen;
  final Widget body;
  BaseScaffoldConfigs copyWith({
    String? nameScreen,
    Widget? body,
  }) {
    return BaseScaffoldConfigs(
      nameScreen: nameScreen ?? this.nameScreen,
      body: body ?? this.body,
    );
  }
}
