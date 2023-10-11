import 'package:flutter/material.dart';

class ListISempty extends StatelessWidget {
  const ListISempty({super.key, required this.text, required this.pathImage});
  final String text;
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pathImage),
          ],
        ),
        const SizedBox(height: 12,),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}
