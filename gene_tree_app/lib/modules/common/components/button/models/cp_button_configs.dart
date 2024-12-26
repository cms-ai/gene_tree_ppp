part of '../cp_button.dart';

enum ButtonType {
  primary,
  secondary,
  danger,
  outline,
}

class CPButtonConfigs {
  final ButtonType type;
  final String content;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  const CPButtonConfigs({
    this.type = ButtonType.primary,
    this.content = '',
    this.width,
    this.height,
    this.padding,
    this.onTap,
  });

  CPButtonConfigs copyWith(ButtonType? type) {
    return CPButtonConfigs(
      type: type ?? this.type,
    );
  }
}
