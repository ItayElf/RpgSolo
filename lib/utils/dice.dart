import 'dart:math';

class Dice {
  int diceSize;
  int diceCount;
  final Random _rand;

  Dice({required this.diceCount, required this.diceSize, Random? random})
      : _rand = random ?? Random();

  List<int> roll() {
    return List.generate(diceCount, (index) => _rand.nextInt(diceSize) + 1);
  }
}
