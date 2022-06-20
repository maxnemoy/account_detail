import 'package:flutter/material.dart';
import 'package:test_screen/src/screens/components/brand_button.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "USD Account",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 16),
                    alignment: Alignment.centerRight,
                    child: BrandButton(
                      child: const Text("Hide"),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "\$ 120,930.59",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
