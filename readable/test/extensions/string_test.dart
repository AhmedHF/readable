import 'package:readable/readable.dart';
import 'package:test/test.dart';

void main() {
  group(
    "convert to another type methods",
    () {
      test(
        'it return a List of Chars from String',
        () {
          expect(
            "Falah".toChars(),
            ['F', 'a', 'l', 'a', 'h'],
          );
          expect(
            "abcd".toChars(),
            ['a', 'b', 'c', 'd'],
          );
          expect(
            ''.toChars(),
            [],
            reason: "because the List is Empty",
          );
        },
      );
      test(
        'convert String to int if is possible',
        () {
          expect('queen'.toIntOrNull(), null);
          expect(''.toIntOrNull(), null);
          expect('20'.toIntOrNull(), 20);
          expect('20'.toIntOr(10), 20);
          expect('or'.toIntOr(5), 5);
          expect('-10'.toInt(), -10);
        },
      );
      test(
        'convert String to double if is possible',
        () {
          expect('queen'.toDoubleOrNull(), null);
          expect(''.toDoubleOrNull(), null);
          expect('20'.toDoubleOrNull(), 20.0);
          expect('5.0'.toDouble(), 5.0);
          expect('10'.toDouble(), 10.0);
          expect(''.toDoubleOr(12), 12.0);
        },
      );
      test(
        'convert String to num if is possible',
        () {
          expect('queen'.toNumOrNull(), null);
          expect(''.toNumOrNull(), null);
          expect('20'.toNumOr(10), 20.0);
          expect('5.0'.toNum(), 5.0);
          expect('10'.toNum(), 10.0);
          expect(''.toNumOr(12), 12.0);
        },
      );
      test(
        'convert String to dateTime if is possible',
        () {
          final dateTimeTest = 'or'.toDateOrNow().year;
          expect('queen'.toDateOrNull(), null);
          expect(''.toDateOrNull(), null);

          expect('now'.toDateOrNow().difference(DateTime.now()).inSeconds, 0);

          expect(dateTimeTest, DateTime.now().year);
          expect("".toDateOr(DateTime(2000)), DateTime(2000));
          expect("".toDateOr(DateTime(2000, 12)), DateTime(2000, 12));
          expect(
            "2021-12-23 21:59".toDate(),
            DateTime(2021, 12, 23, 21, 59),
          );
        },
      );
    },
  );
  group(
    'isPalindrome',
    () {
      test(
        'reverse a String',
        () {
          expect(
            ''.reversed,
            '',
            reason: 'because the string is Empty',
          );
          expect('dart'.reversed, 'trad');
          expect('queen'.reversed, 'neeuq');
        },
      );
      test(
        "Checks if string is isPalindrome.",
        () {
          expect(
            ''.isPalindrome,
            isTrue,
            reason: 'because the string is Empty',
          );
          expect(
            'readableelbadaer'.isPalindrome,
            isTrue,
          );
          expect(
            'falah'.isPalindrome,
            isFalse,
          );
          expect(
            'flutterrettulf'.isPalindrome,
            isTrue,
          );
          expect(
            '20011002'.isPalindrome,
            isTrue,
          );
          expect(
            '20011002-'.isPalindrome,
            isFalse,
          );
        },
      );
    },
  );
  group('capitalize', () {
    test(
      'capitalizeFirst',
      () {
        expect(
          ''.capitalizeFirst,
          '',
          reason: 'because the string is Empty',
        );
        expect('name'.capitalizeFirst, 'Name');
        expect('flutter dev'.capitalizeFirst, 'Flutter dev');
        expect('flutter Dev'.capitalizeFirst, 'Flutter dev');
      },
    );
    test(
      'capitalize',
      () {
        expect(
          ''.capitalize,
          '',
          reason: 'because the string is Empty',
        );
        expect('name'.capitalize, 'Name');
        expect('Your name'.capitalize, 'Your Name');
        expect('flutter dev'.capitalize, 'Flutter Dev');
        expect('flutter Dev'.capitalize, 'Flutter Dev');
      },
    );
  });
  test(
    'lines',
    () {
      expect(
        ''.linesCount,
        1,
        reason: 'because the string is Empty',
      );
      expect('falah\nhassan'.linesCount, 2);
    },
  );
  test(
    'replaceAfter',
    () {
      expect(
        ''.replaceAfter('a', 'f', 'default'),
        'default',
        reason: 'because the string is Empty',
      );
      expect(
        'falah******'.replaceAfter('h', '', 'default'),
        'falah',
      );
      expect(
        'falah******'.replaceAfter('n', ''),
        'falah******',
      );
    },
  );
  test(
    'replaceBefore',
    () {
      expect(
        ''.replaceBefore('a', 'f', 'default'),
        'default',
        reason: 'because the string is Empty',
      );
      expect(
        'falah******'.replaceBefore('h', '', 'default'),
        'h******',
      );
      expect(
        'falah******'.replaceBefore('f', '', 'default'),
        'falah******',
      );
    },
  );
  test(
    'anyChar',
    () {
      expect(
        ''.anyChar((element) => element == 'a'),
        isFalse,
        reason: 'because the string is Empty',
      );
      expect(
        'falah'.anyChar((element) => element == 'a'),
        isTrue,
      );
      expect(
        'hassan'.anyChar((element) => element != 'l'),
        isTrue,
      );
    },
  );
  test(
    'last',
    () {
      expect(
        ''.last,
        '',
        reason: 'because the string is Empty',
      );
      expect(
        'falah'.last,
        'h',
      );
      expect(
        'hassan'.last,
        'n',
      );
    },
  );
}
