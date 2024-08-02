import 'package:bloc/bloc.dart';
import 'package:dars_90/blocs/counter/counter_event.dart';
import 'package:dars_90/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
    on<StartEvent>(_start);
  }

  void _start(StartEvent event, emit) {
    emit(CounterLoadedState(count: 0));
  }

  int _increment(IncrementEvent event, emit) {
    emit(CounterLoadingState());
    try {
      event.count += 1;
      emit(CounterLoadedState(count: event.count));
    } catch (error) {
      emit(CounterErrorState(error: error.toString()));
    }
    return event.count;
  }

  int _decrement(DecrementEvent event, emit) {
    emit(CounterLoadingState());
    try {
      event.count -= 1;
      emit(CounterLoadedState(count: event.count));
    } catch (error) {
      emit(CounterErrorState(error: error.toString()));
    }
    return event.count;
  }
}
