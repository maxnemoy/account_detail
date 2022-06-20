import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screen/src/config/theme_data.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';

class InvoiceAvatar extends StatelessWidget {
  final InvoiceData data;
  const InvoiceAvatar({Key? key, required this.data}) : super(key: key);
  Color getRandomColor() => Color(Random().nextInt(0xffffffff));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(2),
        decoration: data.source.type == SourceType.person
            ? BoxDecoration(
                color: Colors.transparent,
                border: Border.fromBorderSide(
                  BorderSide(
                      width: 1, color: BrandTheme.defaultColorScheme.primary),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              )
            : BoxDecoration(
                color: getRandomColor(),
                border: Border.fromBorderSide(
                  BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.surface),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
        child: data.source.type == SourceType.company
            ? Image.network(
                data.source.logo ??
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Picture_icon_BLACK.svg/1200px-Picture_icon_BLACK.svg.png",
                filterQuality: FilterQuality.medium,
                fit: BoxFit.fitWidth,
              )
            : Icon(data.type == InvoiceTypes.refill
                ? CupertinoIcons.arrow_left
                : CupertinoIcons.arrow_right),
      ),
    );
  }
}
