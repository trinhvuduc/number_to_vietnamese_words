import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
import 'package:test/test.dart';

const int intMaxValue = 9223372036854775807;

void main() {
  group('A group of tests', () {
    const Map<int, String> numbers = {
      1: 'Một',
      10: 'Mười',
      2001: 'Hai nghìn không trăm linh một',
      2023: 'Hai nghìn không trăm hai mươi ba',
      -2023: 'Âm hai nghìn không trăm hai mươi ba',
      10000000: 'Mười triệu',
      -55: 'Âm năm mươi lăm',
      123456789:
          'Một trăm hai mươi ba triệu bốn trăm năm mươi sáu nghìn bảy trăm tám mươi chín',
      1000000000220001: 'Một triệu tỷ hai trăm hai mươi nghìn không trăm linh một',
      999999999999999999: 'Chín trăm chín mươi chín triệu tỷ chín trăm chín mươi chín nghìn tỷ chín trăm chín mươi chín tỷ chín trăm chín mươi chín triệu chín trăm chín mươi chín nghìn chín trăm chín mươi chín',
      intMaxValue:
          'Chín tỷ tỷ hai trăm hai mươi ba triệu tỷ ba trăm bảy mươi hai nghìn tỷ không trăm ba mươi sáu tỷ tám trăm năm mươi tư triệu bảy trăm bảy mươi lăm nghìn tám trăm linh bảy'
    };

    test('First Test', () {
      numbers.forEach((number, word) {
        expect(number.toVietnameseWords(), word);
      });
    });
  });
}
