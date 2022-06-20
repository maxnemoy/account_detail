import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';
import 'package:test_screen/src/utils/concurrency_types.dart';

typedef OnItemSelected = Function(dynamic value);

class BrandDropDownButton<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final OnItemSelected? onSelected;
  const BrandDropDownButton(
      {Key? key,
      required this.value,
      required this.items,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: DropdownButton<T>(
          value: value,
          icon: const Icon(CupertinoIcons.chevron_down),
          items: items,
          onChanged: (value) {
            onSelected?.call(value);
          },
          underline: Container(),
          selectedItemBuilder: (BuildContext context) {
            return items.map((DropdownMenuItem items) {
              String? name;
              if (items.value.runtimeType == InvoiceTypes) {
                name = (items.value as InvoiceTypes).toName();
              }
              if (items.value.runtimeType == ConcurrencyTypes) {
                name = (items.value as ConcurrencyTypes).toName();
              } 
              return Row(
                children: [
                  Text(name ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 16)),
                ],
              );
            }).toList();
          },
          isExpanded: true,
        ),
      ),
    );
  }
}
