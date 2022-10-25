import 'package:bloc/bloc.dart';

abstract class CounterEvent {}


class Increment extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on((event, emit) => emit(state + 1));
  }
  
}
