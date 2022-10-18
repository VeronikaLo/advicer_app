import 'package:advicer/app_theme.dart';
import 'package:advicer/application/bloc/advicer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advicer',
      theme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (context) => AdvicerBloc() ,
        child: const HomePage()),
    );
  }
}


