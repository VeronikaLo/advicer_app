
import 'package:advicer/application/bloc/advicer_bloc.dart';
import 'package:advicer/presentation/widgets/advice_item.dart';
import 'package:advicer/presentation/widgets/custom_button.dart';
import 'package:advicer/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final adviceBloc = BlocProvider.of<AdvicerBloc>(context); // context of Bloc
    return Scaffold(
      appBar:  AppBar(title: const Text('Adviser'), centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: BlocBuilder<AdvicerBloc, AdvicerState>(
                    bloc: adviceBloc,
                    builder: ((context, adviceState) {
                      if(adviceState is AdvicerStateInitial){
                        return  Text("Your Advice is waiting for you!",
                        style: themeData.textTheme.button ,);

                      }else if(adviceState is AdvicerStateLoading){
                        return  CircularProgressIndicator(color: themeData.colorScheme.secondary,);

                      }else if(adviceState is AdvicerStateLoaded){
                        return  AdviceItem(advice: adviceState.advice);

                      }else if(adviceState is AdvicerStateError){
                        return ErrorMessage(message: adviceState.message);
                      }

                      return const Placeholder();

                    })),
                  ),
              ),
              const SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(
                    )),
              ),
            ],)
        ),
      ),
    );
  }
}
