import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/towns/goods.dart';
import 'package:rpgsolo/classes/towns/location.dart';
import 'package:rpgsolo/components/expandable_paragraph.dart';
import 'package:rpgsolo/components/tiles/npc_tile.dart';
import 'package:rpgsolo/data/towns/locations_data.dart';
import 'package:rpgsolo/utils/extensions.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key, required this.location});

  final Location location;

  String getDescription() {
    if (location.type == LocationType.monument ||
        location.type == LocationType.tower) {
      return location.description;
    }
    return "The ${location.type.printedName} \"${location.name.toTitleCase()}\" is located ${location.location}.\n\n ${location.name.toTitleCase()} ${location.description}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${location.name.toTitleCase()} (${location.type.printedName.toTitleCase()})"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SelectableText(
                    location.name.toTitleCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 2,
              ),
              const SizedBox(
                height: 16,
              ),
              ExpandableParagraph(
                title: Text(
                  "Description:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: SelectableText(
                  getDescription(),
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Divider(
                color: Theme.of(context).primaryColorLight,
                thickness: 2,
              ),
              const SizedBox(
                height: 8,
              ),
              location.goods.isNotEmpty
                  ? ExpandableParagraph(
                      title: Text(
                        "Goods:",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: location.goods.length,
                        itemBuilder: (context, i) =>
                            GoodsTile(goods: location.goods[i]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: location.goods.isNotEmpty ? 8 : 0,
              ),
              location.goods.isNotEmpty
                  ? Divider(
                      color: Theme.of(context).primaryColorLight,
                      thickness: 2,
                    )
                  : Container(),
              const SizedBox(
                height: 8,
              ),
              ExpandableParagraph(
                title: Text(
                  location.type == LocationType.monument ? "Artist:" : "Owner:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                child: NpcTile(npc: location.owner),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoodsTile extends StatelessWidget {
  const GoodsTile({super.key, required this.goods});

  final Goods goods;

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.subtitle1!;
    if (goods.description != null) {
      style = style.copyWith(fontWeight: FontWeight.bold);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\u2022",
          style: Theme.of(context).textTheme.headline6,
        ),
        Flexible(
          child: SelectableText.rich(
            TextSpan(
              text: "${goods.name.toTitleCase()} (${goods.price})",
              style: style,
              children: [
                TextSpan(
                    text: goods.description != null
                        ? "\n${goods.description!.toTitleCase(true)}"
                        : "",
                    style: Theme.of(context).textTheme.bodyText1)
              ],
            ),
          ),
        )
      ],
    );
  }
}
