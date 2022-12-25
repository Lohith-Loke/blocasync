import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countervalue: 0));

  void increment() => emit(CounterState(countervalue: state.countervalue + 1));
  void decrement() => emit(CounterState(countervalue: state.countervalue - 1));
}
