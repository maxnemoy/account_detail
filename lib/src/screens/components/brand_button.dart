import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const BrandButton({Key? key, required this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        primary: Theme.of(context).colorScheme.background,
        textStyle: Theme.of(context).textTheme.bodyMedium,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.surface.withOpacity(.3),
        ),
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: child,
    );
  }
}
