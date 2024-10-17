// ignore_for_file: avoid_print

part of 'create_templates.dart';

class _CreateFileHelper {
  static Future<void> createBloc({
    // required String className,
    // required String fileName,
    required String templatePath,
  }) async {
    _ReplaceRegexHolderHelper.handleGetPathAndScreenName(
      onValidInput: (pathInput, fileNameInput) async {
        final className = fileNameInput.toPascalCase();
        final fileName = fileNameInput.toSnakeCase();
        await _CreateFileHelper.createFile(
          className: fileNameInput,
          fileName: fileNameInput,
          templatePath:
              "bin/templates/screen_templates/full_page_folder/simple/file_name/file_name_bloc.dart.tmpl",
          destinationPath: "$pathInput/bloc/${fileNameInput}_bloc.dart",
          from: [RegExp(r'\$ClassName\$'), RegExp(r'\$FileName\$')],
          replace: [className, fileName],
        );

        await _CreateFileHelper.createFile(
          className: fileNameInput,
          fileName: fileNameInput,
          templatePath:
              "bin/templates/screen_templates/full_page_folder/simple/file_name/file_name_state.dart.tmpl",
          destinationPath: "$pathInput/bloc/${fileName}_state.dart",
          from: [RegExp(r'\$ClassName\$'), RegExp(r'\$FileName\$')],
          replace: [className, fileName],
        );

        await _CreateFileHelper.createFile(
          className: fileNameInput,
          fileName: fileNameInput,
          templatePath:
              "bin/templates/screen_templates/full_page_folder/simple/file_name/file_name_event.dart.tmpl",
          destinationPath: "$pathInput/bloc/${fileName}_event.dart",
          from: [RegExp(r'\$ClassName\$'), RegExp(r'\$FileName\$')],
          replace: [className, fileName],
        );
      },
    );
    // Khởi tạo bloc vs function createFile
  }

  static Future<void> createFile({
    required String className,
    required String fileName,
    required String templatePath,
    required String destinationPath,
    List<Pattern>? from,
    List<String>? replace,
  }) async {
    // Xử lý gen file (bloc,)
    // print("======= ${destinationPath}");
    try {
      final File file = await File(destinationPath).create(recursive: true);
      final newContent = await _ReplaceRegexHolderHelper.copyFromTemplate(
        sourcePath: templatePath,
        from: from ?? [],
        replace: replace ?? [],
      );
      await file.writeAsString(newContent);
    } catch (e) {
      print("Error: $e");
    }
  }
}

class _ReplaceRegexHolderHelper {
  static Future<String> copyFromTemplate({
    required String sourcePath,
    required List<Pattern> from,
    required List<String> replace,
  }) async {
    try {
      var sourceFile = await File(sourcePath).readAsString();

      // print("Old file: $from");
      for (var i = 0; i < from.length; i++) {
        sourceFile = sourceFile.replaceAll(from[i], replace[i]);
      }
      // print("New file: $sourceFile");

      return sourceFile;
    } catch (e) {
      print("copyFromTemplate: $e");
      return "";
    }
  }

  static Future<void> handleGetPathAndScreenName({
    required void Function(
      String pathInput,
      String fileNameInput,
    ) onValidInput,
    String? defaultPathInput,
  }) async {
    // Đường dẫn folder
    // bool isFilePathValid = false;
    bool isFileNameValid = false;
    bool filePathExits = false;
    String fileNameInput = '';
    print("Nhập đường dẫn file mà bạn muốn tạo");

    if (defaultPathInput == null || defaultPathInput.isEmpty) {
      print("Vui lòng nhập đường dẫn file bạn muốn tạo");
    } else {
      print(
          'Nhập đường dẫn tới folder muốn tạo files, Enter để lấy đường dẫn mặc định đến $defaultPathInput');
    }

    String? targetPath = stdin.readLineSync()?.trim().replaceAll("'", "") ?? '';

    // print("Path: ${targetPath}");

    if (targetPath.isEmpty &&
        defaultPathInput != null &&
        defaultPathInput.isNotEmpty) {
      targetPath = defaultPathInput;
    }

    try {
      do {
        print("Nhập tên file muốn tạo");
        fileNameInput = stdin.readLineSync()?.trim() ?? '';
        isFileNameValid = _FileNameValidator.isFileNameValid(fileNameInput);
        final directory = Directory("$targetPath/$fileNameInput");
        filePathExits = directory.existsSync();
        if (filePathExits) {
          print("File đã tồn tại. Xin vui lòng thử lại");
          continue;
        }

        if (!isFileNameValid) {
          print('Tên file không hợp lệ! Vui lòng thử lại: ');
        } else {
          isFileNameValid = true;
        }
      } while (filePathExits || !isFileNameValid);
      onValidInput(targetPath, fileNameInput);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class _FileNameValidator {
  static bool isFileNameValid(String fileName) {
    return fileName.isNotEmpty || fileName.contains(RegExp(r'[,;:!@#$%^&*()]'));
  }
}
