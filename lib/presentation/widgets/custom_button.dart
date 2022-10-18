import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  const CustomButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap:()=> onPressed(),
      radius: 5 ,
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
        ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text('Get Advice', style: Theme.of(context).textTheme.button,) ),
        ),
      ),
    );
  }
}