part of 'base_scaffold.dart';

class BaseScaffoldConfigs {
  const BaseScaffoldConfigs({
    required this.nameScreen,
    required this.body,
    this.bottomNavigationBar,
  });
  final String nameScreen;
  final Widget body;
  final Widget? bottomNavigationBar;
  BaseScaffoldConfigs copyWith({
    String? nameScreen,
    Widget? body,
    Widget? bottomNavigationBar,
  }) {
    return BaseScaffoldConfigs(
      nameScreen: nameScreen ?? this.nameScreen,
      body: body ?? this.body,
      bottomNavigationBar: bottomNavigationBar ?? this.bottomNavigationBar,
    );
  }
}
