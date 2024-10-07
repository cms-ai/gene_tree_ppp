part of 'create_templates.dart';

class _CreateFileHelper {
  static Future<void> createFile({
    required String className,
    required String fileName,
    required String templatePath,
    required String destinationPath,
    List<Pattern>? from,
    List<String>? replace,
  }) async {
    // Xử lý gen file (bloc,)

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
      final sourceFile = await File(sourcePath).readAsString();

      for (var i = 0; i < from.length; i++) {
        sourceFile.replaceAll(from[i], replace[i]);
      }

      return sourceFile;
    } catch (e) {
      print("copyFromTemplate: $e");
      return "";
    }
  }
}
