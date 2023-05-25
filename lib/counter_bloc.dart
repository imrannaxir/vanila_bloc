import 'dart:async';
import 'package:vanila_bloc/counter_event.dart';
import 'package:vanila_bloc/counter_state.dart';

class CounterBloc {
  final StreamController<CounterEvent> _evenStreamController =
      StreamController<CounterEvent>();

  final StreamController<CounterState> _stateStreamController =
      StreamController<CounterState>();

  CounterState state = const CounterState(counter: 0);

  StreamSink<CounterEvent> get eventSink => _evenStreamController.sink;
  // Stream mean listen
  //  Listen to Events emitted by the stream using the stream property.
  Stream<CounterState> get stateStream => _stateStreamController.stream;

  CounterBloc() {
    _evenStreamController.stream.listen(mapEventToState);
  }

  void mapEventToState(CounterEvent event) {
    if (event is IncrementCounterEvent) {
      state = CounterState(counter: state.counter + 1);
      _stateStreamController.sink.add(state);
    } else {
      state = CounterState(counter: state.counter - 1);
      _stateStreamController.sink.add(state);
    }
  }
}
