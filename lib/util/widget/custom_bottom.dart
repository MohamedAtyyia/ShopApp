import 'package:flutter/material.dart';

class Custombottom extends StatelessWidget {
  const Custombottom({super.key, required this.text,  required this.ontap});
  final String text;

final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.symmetric(vertical: 12),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              backgroundColor: const Color(0xff01BE84),
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}
