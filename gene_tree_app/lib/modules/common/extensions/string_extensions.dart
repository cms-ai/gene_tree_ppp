extension StringExt on String {
  ///
  /// Hello World => hello_world
  ///
  String toSnakeCase({String? splitValue}) {
    return split(splitValue ?? " ").map((e) => e.toLowerCase()).join("_");
  }

  ///
  /// hello_world => HelloWorld
  ///

  String toPascalCase({String? splitValue}) {
    return split(splitValue ?? '_').map((word) {
      return word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '';
    }).join('');
  }

  ///
  /// hello_world => helloWorld
  ///

  String toCamelCase({String? splitValue}) {
    List<String> words = split(splitValue ?? '_');
    if (words.isEmpty) return '';

    // Chữ cái đầu tiên viết thường, các chữ sau viết hoa chữ cái đầu
    String firstWord = words[0].toLowerCase();
    String camelCase = words.skip(1).map((word) {
      return word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '';
    }).join('');

    return firstWord + camelCase;
  }
}
