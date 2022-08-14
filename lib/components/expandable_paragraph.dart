import 'package:flutter/material.dart';

class ExpandableParagraph extends StatefulWidget {
  const ExpandableParagraph(
      {super.key, required this.title, required this.child, this.gap = 8});

  final Text title;
  final double gap;
  final Widget child;

  @override
  State<ExpandableParagraph> createState() => _ExpandableParagraphState();
}

class _ExpandableParagraphState extends State<ExpandableParagraph> {
  bool collapsed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => setState(() {
            collapsed = !collapsed;
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.title,
              Icon(collapsed ? Icons.expand_more : Icons.expand_less)
            ],
          ),
        ),
        collapsed
            ? Container()
            : SizedBox(
                height: widget.gap,
              ),
        collapsed ? Container() : widget.child,
      ],
    );
  }
}
