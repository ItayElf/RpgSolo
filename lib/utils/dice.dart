import 'dart:math';

class Dice {
  int diceSize;
  int diceCount;
  final Random _rand;

  Dice({required this.diceCount, required this.diceSize}) : _rand = Random();

  List<int> roll() {
    return List.generate(diceCount, (index) => _rand.nextInt(diceSize) + 1);
  }
}
