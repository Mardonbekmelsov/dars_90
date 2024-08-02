import 'package:equatable/equatable.dart';

sealed class CounterState extends Equatable {}

class CounterInitialState extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterLoadingState extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterLoadedState extends CounterState {
  final int count;

  CounterLoadedState({required this.count});

  @override
  // TODO: implement props
  List<Object?> get props => [count];
}

class CounterErrorState extends CounterState {
  final String error;
  CounterErrorState({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
