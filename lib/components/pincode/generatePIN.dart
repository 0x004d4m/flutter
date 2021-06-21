import 'dart:math';

String generateRandomInt() {
  var rng = new Random();
  int length = 4;
  String charachters = '0123456789';
  int charactersLength = charachters.length;
  String randomString = '';
  for (int i = 0; i < length; i++) {
    randomString += charachters[rng.nextInt(charactersLength - 1)];
  }
  return randomString;
}
