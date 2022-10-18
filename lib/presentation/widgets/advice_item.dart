import 'package:flutter/material.dart';


class AdviceItem extends StatelessWidget {
  final String advice;
  const AdviceItem({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
        ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              "'$advice'", 
              style: Theme.of(context).textTheme.headline1, 
              textAlign: TextAlign.center,) ),
        ),
      );
  }
}