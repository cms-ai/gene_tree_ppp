part of '../cp_cm_text_field.dart';

enum CMTexFieldTypeEnum {
  normal,
  password,
  search,
}

class CPCmTextFieldConfigs {
  final CMTexFieldTypeEnum type;
  final HintTextConfigs? hintTextConfigs;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  const CPCmTextFieldConfigs({
    this.type = CMTexFieldTypeEnum.normal,
    this.contentPadding,
    this.hintTextConfigs,
    this.controller,
  });
}

class HintTextConfigs {
  final String? hintText;
  final TextStyle? hintStyle;
  const HintTextConfigs({
    this.hintText,
    this.hintStyle,
  });

  HintTextConfigs copyWith() {
    return const HintTextConfigs();
  }
}
