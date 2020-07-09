/*
 * @Author: Vincent Feng 
 * @Date: 2020-07-09 22:59:52 
 * @Last Modified by: Vincent Feng
 * @Last Modified time: 2020-07-09 23:26:08
 */
import 'dart:async';

import 'package:bloc_counter/counter_event.dart';

class CounterBloc {
  //data field
  int _counter = 0;
  //for state
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;
  //for events
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
  //constructor
  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(CounterEvent counterEvent) {
    if (counterEvent is DecrementEvent) {
      _counter--;
    } else {
      _counter++;
    }
    _inCounter.add(_counter);
  }

  //do not forget to release the resource
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }

  ///
}
