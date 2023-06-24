// ignore_for_file: constant_identifier_names

const List<String> ZERO_LEFT_PADDING = ["", "00", "0"];

const List<String> DIGITS = [
  "không",
  "một",
  "hai",
  "ba",
  "bốn",
  "năm",
  "sáu",
  "bảy",
  "tám",
  "chín"
];

const List<String> MULTIPLE_THOUSAND = [
  "",
  "nghìn",
  "triệu",
  "tỷ",
  "nghìn tỷ",
  "triệu tỷ",
  "tỷ tỷ"
];

bool shouldShowZeroHundred(List<String> goups) {
  List<String> reversedGroups = [...goups].reversed.toList();
  int count = reversedGroups.takeWhile((it) => it == "000").length;
  return count < reversedGroups.length - 1;
}

String readTriple(String triple, bool showZeroHundred) {
  List<int> digits = triple.split('').map(int.parse).toList();

  int a = digits[0];
  int b = digits[1];
  int c = digits[2];

  if (a == 0 && b == 0 && c == 0) {
    return "";
  } else if (a == 0 && showZeroHundred) {
    return "không trăm ${readPair(b, c)}";
  } else if (a == 0 && b == 0) {
    return DIGITS[c];
  } else if (a == 0) {
    return readPair(b, c);
  } else {
    return "${DIGITS[a]} trăm ${readPair(b, c)}";
  }
}

String readPair(int b, int c) {
  switch (b) {
    case 0:
      return c == 0 ? '' : 'linh ${DIGITS[c]}';
    case 1:
      switch (c) {
        case 0:
          return 'mười';
        case 5:
          return 'mười lăm';
        default:
          return 'mười ${DIGITS[c]}';
      }
    default:
      switch (c) {
        case 0:
          return '${DIGITS[b]} mươi ';
        case 1:
          return '${DIGITS[b]} mươi mốt';
        case 4:
          return '${DIGITS[b]} mươi tư';
        case 5:
          return '${DIGITS[b]} mươi lăm';
        default:
          return '${DIGITS[b]} mươi ${DIGITS[c]}';
      }
  }
}
