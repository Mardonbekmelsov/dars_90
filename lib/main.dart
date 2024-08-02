import 'package:dars_90/blocs/counter/counter_bloc.dart';
import 'package:dars_90/ui/screens/connectivity_screen.dart';
import 'package:dars_90/ui/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: ConnectivityScreen(),
      ),
    );
  }
}
