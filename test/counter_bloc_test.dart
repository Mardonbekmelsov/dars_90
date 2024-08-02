import 'package:bloc_test/bloc_test.dart';
import 'package:dars_90/blocs/counter/counter_bloc.dart';
import 'package:dars_90/blocs/counter/counter_event.dart';
import 'package:dars_90/blocs/counter/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group("Counter", () {
    late CounterBloc counterBloc;
    setUp(() {
      counterBloc = CounterBloc();
    });

    test("state", () {
      expect(counterBloc.state, CounterInitialState());
    });

    blocTest(
      "counter",
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(IncrementEvent(count: 2));
      },
      expect: () {
        return [CounterLoadingState(), CounterLoadedState(count: 3)];
      },
    );
  });
}
