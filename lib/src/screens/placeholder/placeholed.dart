import 'package:flutter/material.dart';

class PlaceHolderScreen extends StatelessWidget {
  const PlaceHolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.black,
      )),
    );
  }
}
