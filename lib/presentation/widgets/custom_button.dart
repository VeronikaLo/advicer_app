import 'package:advicer/application/bloc/advicer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap:()=> BlocProvider.of<AdvicerBloc>(context).add(AdviceGetEvent()),
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