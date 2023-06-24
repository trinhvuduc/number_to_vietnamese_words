import 'dart:math';

import 'package:number_to_vietnamese_words/src/utils.dart';

extension StringExtensions on String {
  Iterable<String> chunk(int chunkSize) sync* {
    for (int i = 0; i < length; i += chunkSize) {
      yield substring(i, min(i + chunkSize, length));
    }
  }

  String capitalize() {
    if (isEmpty) {
      throw 'Input cannot be empty';
    } else {
      return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
    }
  }
}

extension IntegerExtensions on int {
  String toVietnameseWords() {
    if (this == 0) {
      return 'Không';
    }

    if (this < 0) {
      return 'Âm ${(-this).toVietnameseWords().toLowerCase()}';
    }

    String s = toString();

    List<String> groups =
        (ZERO_LEFT_PADDING[s.length % 3] + s).chunk(3).toList();
    bool showZeroHundred = shouldShowZeroHundred(groups);

    int index = -1;
    String rawResult = groups.fold('', (String acc, String e) {
      index++;
      String triple = readTriple(e, showZeroHundred && index > 0);
      String multipleThousand = triple.trim().isEmpty
          ? ''
          : MULTIPLE_THOUSAND[groups.length - 1 - index];
      return '$acc $triple $multipleThousand';
    });

    return RegExp(r'\s+').allMatches(rawResult).isEmpty
        ? rawResult.trim().capitalize()
        : rawResult.replaceAll(RegExp(r'\s+'), ' ').trim().capitalize();
  }
}
