import 'package:flutter/material.dart';

class FailuerWidget extends StatelessWidget {
  const FailuerWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
   return Center(
            child: Text(errorMessage,
            style: Theme.of(context).textTheme.titleMedium,
            ),
          );  }
}