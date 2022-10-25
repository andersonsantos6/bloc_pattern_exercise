import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

abstract class CounterState {
  final int count;
  CounterState({required this.count});
}

class InitialCountState extends CounterState {
  InitialCountState() : super(count: 0);
}

class IncrementState extends CounterState {
  IncrementState({required int count}) : super(count: count);
}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCountState()) {
    on((event, emit) {
      if (event is Increment) {
        emit(IncrementState(count: state.count + 1));
        return;
      }
      if (event is Decrement) {
        emit(IncrementState(count: state.count - 1));
        return;
      }
    });
  }
}
