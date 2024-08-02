import 'package:dars_90/blocs/counter/counter_bloc.dart';
import 'package:dars_90/blocs/counter/counter_event.dart';
import 'package:dars_90/blocs/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CounterBloc>().add(StartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CounterErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is CounterLoadedState) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(DecrementEvent(count: state.count));
                    },
                    icon: Icon(
                      Icons.remove,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(state.count.toString()),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(IncrementEvent(count: state.count));
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Text("malumot yoq"),
          );
        },
      ),
    );
  }
}
