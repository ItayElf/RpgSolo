import 'dart:math';

import 'package:rpgsolo/classes/towns/goods.dart';
import 'package:rpgsolo/data/towns/locations_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class GoodsGenerator {
  static List<Goods> generate(LocationType type, [Random? random]) {
    Random rand = random ?? Random();
    if (type == LocationType.tavern) {
      return _generateTavernGoods(rand);
    } else if (type == LocationType.smithy ||
        type == LocationType.weaponry ||
        type == LocationType.armory) {
      return _generateFromMap(smithyGoods, rand);
    } else if (type == LocationType.generalStore) {
      return _generateFromMap(storeGoods, rand);
    } else if (type == LocationType.temple) {
      return _generateFromMap(templeGoods, rand, 3);
    } else if (type == LocationType.library) {
      return _generateFromMap(libraryGoods, rand)
          .map((e) => Goods(name: "Book", price: e.price, description: e.name))
          .toList();
    }
    return [];
  }

  static List<Goods> _generateTavernGoods(Random random) {
    List<Goods> goods = [];
    Goods generateWine() {
      bool isRed = random.nextBool();
      String type =
          random.chooseFrom(isRed ? tavernRedWineTypes : tavernWhiteWineTypes);
      String origin = random.chooseFrom(tavernWineOrigin.keys.toList());
      String name =
          "${random.chooseFrom(tavernBevrageName1)} ${random.chooseFrom(tavernBevrageName2)} $type"
              .toLowerCase();
      String description =
          "A$origin ${isRed ? "red" : "white"} wine ${random.chooseFrom(tavernWineBouquet)} ";
      String desc1 = random.chooseFrom(tavernWineDescription);
      String desc2 = random.chooseFrom(tavernWineDescription);
      while (desc2 == desc1) {
        desc2 = random.chooseFrom(tavernWineDescription);
      }
      description += "$desc1 and $desc2.";
      double cost =
          (((tavernWineOrigin[origin] ?? 0) * (random.nextDouble() * .5 + 1)) *
                      10)
                  .toInt() /
              10;
      String price = "$cost sp";
      return Goods(name: name, price: price, description: description);
    }

    Goods generateBeer() {
      String type = random.chooseFrom(tavernBeerType);
      String name =
          "${random.chooseFrom(tavernBevrageName1)} ${random.chooseFrom(tavernBevrageName2)} $type"
              .toLowerCase();
      String origin = random.chooseFrom(tavernBeerOrigin.keys.toList());
      String description =
          "A$origin $type. Described as a${random.chooseFrom(tavernBeerFlavor)} $type with a ${random.chooseFrom(tavernBeerFinish)} finish.";
      double cost =
          (((tavernBeerOrigin[origin] ?? 0) * (random.nextDouble() * .5 + 1)) *
                      10)
                  .toInt() /
              10;
      String price = "$cost cp";
      return Goods(name: name, price: price, description: description);
    }

    Goods generateFood() {
      String meat = random.chooseFrom(tavernMeats.keys.toList());
      String cooking = random.chooseFrom(tavernCookingMethods);
      String name = "$cooking $meat";
      String description =
          "${cooking.toTitleCase(true)} $meat ${random.chooseFrom(tavernFoodSauce)} ${random.chooseFrom(tavernFoodPresentation)} ${random.chooseFrom(tavernFoodSide)}.";
      double cost =
          (((tavernMeats[meat] ?? 0) * (random.nextDouble() * .75 + .5)) * 10)
                  .toInt() /
              10;
      String price = "$cost gp";
      return Goods(name: name, price: price, description: description);
    }

    goods = [generateWine(), generateBeer(), generateFood()];
    Goods g = random.chooseFrom([generateBeer, generateWine, generateWine])();
    while (goods.map((e) => e.name).contains(g.name)) {
      g = random.chooseFrom([generateBeer, generateWine, generateWine])();
    }
    goods.add(g);
    return goods;
  }

  static List<Goods> _generateFromMap(Map<String, String> map, Random random,
      [int count = 4]) {
    List<Goods> goods = [];
    late Goods g;

    Goods generateNew() {
      String name = random.chooseFrom(map.keys.toList());
      double cost = double.parse((map[name] ?? "0 0").split(" ")[0]);
      cost = ((cost * (random.nextDouble() * .75 + .5)) * 10).toInt() / 10;
      return Goods(
          name: name, price: "$cost ${(map[name] ?? "0 0").split(" ")[1]}");
    }

    for (int _ in List.generate(count, (i) => i)) {
      g = generateNew();
      while (goods.map((e) => e.name).contains(g.name)) {
        g = generateNew();
      }
      goods.add(g);
    }
    return goods;
  }
}
