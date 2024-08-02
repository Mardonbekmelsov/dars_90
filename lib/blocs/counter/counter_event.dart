sealed class CounterEvent {}

class StartEvent extends CounterEvent{}

class IncrementEvent extends CounterEvent {
  int count;

  IncrementEvent({required this.count});
}

class DecrementEvent extends CounterEvent {
  int count;

  DecrementEvent({required this.count});
}
