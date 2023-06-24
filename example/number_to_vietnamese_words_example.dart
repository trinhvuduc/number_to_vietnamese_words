import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';

void main() {
  print(1.toVietnameseWords()); // Một
  print(10.toVietnameseWords()); // Mười
  print(2001.toVietnameseWords()); // Hai nghìn không trăm linh một
  print((-55).toVietnameseWords()); // Âm năm mươi lăm
  print(2023.toVietnameseWords()); // Hai nghìn không trăm hai mươi ba
  print(10000000.toVietnameseWords()); // Mười triệu
  print(1000000001.toVietnameseWords()); // Một tỷ không trăm linh một
}
