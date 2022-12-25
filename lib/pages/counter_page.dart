// ignore_for_file: prefer_const_constructors

import 'package:blocasync/counter_bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            
            return Text(state.countervalue.toString());

          },
        ),
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         context.read<CounterCubit>().decrement();
      //       },
      //       heroTag: null,
      //       child: const Icon(Icons.remove),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         context.read<CounterCubit>().increment();
      //       },
      //       heroTag: null,
      //       child: const Icon(Icons.add),
      //     )
      //   ],
      // ),

    );
  }
}
