import 'dart:developer' as dev;
import 'dart:io';

part 'helpers.dart';

void main() {
  print("Tính năng tạo template");

  print("======================================================");
  print("0. Exit");
  print("1. Tạo 1 màn hình đơn giản");
  print("2. Tạo 1 màn hình (có sử dụng bloc)");
  print("3. Tạo component");
  print("5. Thêm api mới vào file có sẵn");
  print("======================================================");

  String? inputSelection;
  bool isInputValueValid = false;

  inputSelection = stdin.readLineSync()?.trim();

  do {
    switch (inputSelection) {
      case "q":
      case "0":
        exit(0);
      case "1":
        print("Running======");
        _CreateFileHelper.createFile(
          className: "ThemeTest",
          fileName: "them_test",
          templatePath:
              "bin/templates/screen_templates/full_page_folder/simple/file_name/file_name_bloc.dart.tmpl",
          destinationPath: "lib/modules/common/theme/ai.dart",
          from: [],
          replace: [],
        );
        isInputValueValid = true;
        break;

      case "2":
        isInputValueValid = true;
        break;

      case "3":
        isInputValueValid = true;
        break;

      default:
    }
  } while (!isInputValueValid);
}
