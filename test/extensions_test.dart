import 'package:test/test.dart';
import 'package:string_utility/string_utility.dart';

void main() {
  final w1 = 'W   133/9/RVI/#Ep';
  final w2 = 'JNI AF/ti221 Duck-Bill    :OK';
  final w3 = ' Henma 776-90/hornclad   JonPantU=+ a';
  final w4 = 'J \s/s Gonta/42/TVI';

  final listString = [w1, w2, w3, w4];

  group('remove all whitespaces', () {
    test('String Data Type', () {
      final testList = listString.map((e) => e.removeExtraWhiteSpaces);
      expect(testList.every((element) => element is String), true);
    });
    test('empty string input', () {
      final emptyStrings = ['', '', ''].map((e) => e.removeExtraWhiteSpaces);

      expect(emptyStrings.every((element) => element is String), true);
    });
  });
  group('Match All Join', () {
    final regex = RegExp(r'\w');

    final listMatched = [
      'W1339RVIEp'
          'JNIAFti221DuckBillOK'
          'Henma77690horncladJonPantUa'
          'JssGonta42TVI'
    ];
    test('regex match word', () {
      final testString = w1.matchAllJoin(regex);
      final expected = 'W1339RVIEp';
      expect(testString, expected);
    });
  });

  group('isUppercase', () {
    test('string contain uppercase', () {
      final word = 'uuu ... yyy, 09() Ui';

      expect(word.containsUpperCase, true);
    });
  });

  group('isLowercase', () {
    test('string contain lowercase', () {
      final word = 'ABCDQWc  32ERTIOp';

      expect(word.containsLowerCase, true);
    });
  });

  group('isAlphanumeric', () {
    test('string is alphanumeric', () {
      final word = '43fsdfApc--0';
      expect(word.isAlphanumeric, true);
    });
  });

  group('isEmail', () {
    test('string is valid email', () {
      final email = 'gan@gastron.com';

      expect(email.isEmail, true);
    });

    test('string is not valid email', () {
      final email = 'ngasal.com hehehe';

      expect(email.isEmail, false);
    });
  });

  group('isUrl', () {
    test('string is valid url mandatory protocol', () {
      final url = 'http://www.google.com';

      expect(url.isUrl(), true);
    });

    test('string is valid url optional protocol', () {
      final url = 'google.com';

      expect(url.isUrl(protocolMandatory: false), true);
    });
  });
}
