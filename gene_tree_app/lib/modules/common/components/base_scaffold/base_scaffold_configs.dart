part of 'base_scaffold.dart';

class BaseScaffoldConfigs {
  const BaseScaffoldConfigs({
    required this.nameScreen,
    required this.body,
    this.bottomNavigationBar,
  });
  final String nameScreen;
  final Widget Function(ThemeState themeState) body;
  final Widget? Function(ThemeState themeState)? bottomNavigationBar;
  BaseScaffoldConfigs copyWith({
    String? nameScreen,
    Widget Function(ThemeState themeState)? body,
    Widget? Function(ThemeState themeState)? bottomNavigationBar,
  }) {
    return BaseScaffoldConfigs(
      nameScreen: nameScreen ?? this.nameScreen,
      body: body ?? this.body,
      bottomNavigationBar: bottomNavigationBar ?? this.bottomNavigationBar,
    );
  }
}
