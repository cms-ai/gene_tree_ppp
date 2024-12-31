part of 'base_scaffold.dart';

class BaseScaffoldConfigs {
  const BaseScaffoldConfigs({
    required this.nameScreen,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
  });
  final String nameScreen;
  final PreferredSizeWidget? appBar;
  final Widget Function(ThemeState themeState) body;
  final Widget? Function(ThemeState themeState)? bottomNavigationBar;
  BaseScaffoldConfigs copyWith({
    String? nameScreen,
    Widget Function(ThemeState themeState)? body,
    Widget? Function(ThemeState themeState)? bottomNavigationBar,
    PreferredSizeWidget? appBar,
  }) {
    return BaseScaffoldConfigs(
      nameScreen: nameScreen ?? this.nameScreen,
      body: body ?? this.body,
      bottomNavigationBar: bottomNavigationBar ?? this.bottomNavigationBar,
      appBar: appBar ?? this.appBar,
    );
  }
}
