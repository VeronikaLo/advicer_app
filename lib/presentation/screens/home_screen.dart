
import 'package:advicer/presentation/widgets/advice_item.dart';
import 'package:advicer/presentation/widgets/custom_button.dart';
import 'package:advicer/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);
    return Scaffold(
      appBar:  AppBar(title: const Text('Advicer'), centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: ErrorMessage(message: 'Error happened'),
                  //AdviceItem(advice: 'This is only an example',), 
                  /*Text("Your Advice is waiting for you!", 
                  style: Theme.of(context).textTheme.button , ),*/
                  ),
              ),
              SizedBox(
                height: 200,
                child: Center(child: CustomButton(onPressed:(){} ,)),
              ),
            ],)
        ),
      ),
    );
  }
}
