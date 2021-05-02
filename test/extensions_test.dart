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

  group('censored', () {
    test('censor single word', () {
      final word = 'MySensitiveWord';

      expect(word.censored, 'My************d');
    });

    test('censor multiple words', () {
      final words = 'Some Longer Sentence';

      expect(words.censored, 'So*e Lo***r Se*****e');
    });
  });

  group('containUppercase', () {
    test('string contain uppercase', () {
      final word = 'uuu ... yyy, 09() Ui';

      expect(word.containsUpperCase, true);
    });
  });

  group('containLowercase', () {
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
  group('isAlphanumericUpperCase', () {
    test('string is alphanumeric', () {
      final word = '43fsdfApc';
      expect(word.isAlphanumericUppercase, true);
    });
  });
  group('isAlphanumericUpperCaseWithSymbol', () {
    test('string is alphanumeric uppercase with symbol', () {
      final word = '43fsdfApc!@0ABC';
      expect(word.isAlphanumericUppercaseWithSymbol, true);
    });
  });

  group('isEmail', () {
    test('string is valid email', () {
      final List emails = [
        'gan@gastron.com',
        'nadiem@krom.us',
        'nexttry@try.de',
        'firstky123@me.me',
      ];

      expect(emails.any((element) => element.toString().isEmail), true);
    });

    test('string is not valid email', () {
      final List notValidEmails = [
        'ngasal.com hehehe',
        'fills @ #.hh',
        'krait()()#@j.jj',
        '())***@jos.josh',
      ];

      expect(
          notValidEmails.any((element) => element.toString().isEmail), false);
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
