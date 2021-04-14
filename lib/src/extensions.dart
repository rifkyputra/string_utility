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

  bool get isContainWhiteSpace {
    if (this.length < 2) return false;
    // return this.contains(RegExp(r'^(?=.*?[\s]).*$'));
    return this.contains(RegExp(r'\s'));
  }

  String get censored {
    return this
        .split(' ')
        .map((e) => e.replaceRange(2, e.length - 1,
            '${List.generate(e.length - 3, (index) => '*').join('')}'))
        .join(' ');
  }

  bool get isAlphanumeric {
    if (this.length < 2) return false;
    return this.contains(RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).*$'));
  }

  bool get isAlphanumericUppercase {
    if (this.length < 2) return false;
    return this.contains(RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[A-Z]).*$'));
  }

  bool get isAlphanumericUppercaseWithSymbol {
    if (this.length < 2) return false;
    return this.contains(
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[A-Z])(?=.*?[!@#$]).*$'));
  }

  bool get containsUpperCase {
    return this.contains(RegExp(r'(?=.*?[A-Z]).*'));
  }

  // bool
}
