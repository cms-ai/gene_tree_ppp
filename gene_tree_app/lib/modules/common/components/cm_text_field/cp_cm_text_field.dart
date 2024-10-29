import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
part './models/cp_cm_text_field_configs.dart';

class CPCmTextField extends StatefulWidget {
  const CPCmTextField({
    super.key,
    required this.configs,
    this.onChanged,
  });
  final CPCmTextFieldConfigs configs;
  final void Function(String)? onChanged;

  @override
  State<CPCmTextField> createState() => _CPCmTextFieldState();
}

class _CPCmTextFieldState extends State<CPCmTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  HintTextConfigs? get hintTextConfigs => widget.configs.hintTextConfigs;

  @override
  Widget build(BuildContext context) {
    switch (widget.configs.type) {
      case CMTexFieldTypeEnum.normal:
        return _buildNormalTextField();
      case CMTexFieldTypeEnum.password:
        return _buildPasswordTextField();
      case CMTexFieldTypeEnum.search:
        return _buildSearchTextField();
    }
  }

  Widget _buildNormalTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: hintTextConfigs?.hintText,
        hintStyle: hintTextConfigs?.hintStyle,
        contentPadding: widget.configs.contentPadding ?? EdgeInsets.all(8.h),
        isDense: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: hintTextConfigs?.hintText,
        hintStyle: hintTextConfigs?.hintStyle,
        contentPadding: widget.configs.contentPadding ?? EdgeInsets.all(8.h),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: hintTextConfigs?.hintText,
        hintStyle: hintTextConfigs?.hintStyle,
        contentPadding: widget.configs.contentPadding ?? EdgeInsets.all(8.h),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
