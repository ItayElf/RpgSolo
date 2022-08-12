import 'package:flutter/material.dart';
import 'package:rpgsolo/classes/npcs/relative.dart';
import 'package:rpgsolo/utils/extensions.dart';

class RelativeParagraph extends StatelessWidget {
  const RelativeParagraph(
      {super.key, required this.relative, required this.relatedName});

  final Relative relative;
  final String relatedName;

  @override
  Widget build(BuildContext context) {
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
                text:
                    "${relative.name.toTitleCase()} (${relative.role.toTitleCase()})\n",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text:
                        "${relative.firstName.toTitleCase()} is a ${relative.alignment.toLowerCase()} ${relative.isMale ? "male" : "female"} ${relative.occupation}. "
                        "${relative.relPronoun.toTitleCase()} relationship with ${relatedName.toTitleCase()} is ${relative.relationship}. "
                        "${relative.firstName.toTitleCase()} ${relative.status}.",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ]),
          ),
        )
      ],
    );
  }
}
