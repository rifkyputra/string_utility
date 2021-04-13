extension ExtendedString on String {
  /// Remove extra whitespace between words then trim.
  String get removeExtraWhiteSpaces {
    final regex = RegExp(r'\S+');
    final words = regex.allMatches(this).map((v) => v.group(0)).join(' ');
    return words;
  }

  ///
  ///Extracting text from a string with regex groups
  String matchAllJoin(RegExp regex, {String onNotFound = ''}) {
    final matchedString = regex
        .allMatches(this)
        .map<String>((v) => v.group(0))
        .join(',')
        .replaceAll(',', '');

    return matchedString.isEmpty ? onNotFound : matchedString;
  }
}
