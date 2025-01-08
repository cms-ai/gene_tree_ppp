part of '../cm_dialog_screen.dart';

enum CmDialogType {
  alert,
  confirmation,
  custom,
  loading,
  none,
  success,
}

class CmDialogArgument {
  final CmDialogType type;
  final String? title;
  final String? content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  CmDialogArgument({
    required this.type,
    this.title,
    this.content,
    this.onConfirm,
    this.onCancel,
  });
}
