// ignore_for_file: prefer_const_constructors

import 'package:blocasync/counter_bloc/counter_cubit.dart';
import 'package:blocasync/pages/counter_page.dart';
import 'package:blocasync/pages/popmovies_page.dart';
import 'package:blocasync/popularmovie_bloc/popularmovie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //       create: (context) => CounterCubit(),
  //       child: MaterialApp(
  //         home: CounterPage(),
  //       ),
  //       );
  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularmovieCubit(),
      child: MaterialApp(home: PopMoviesPage()),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   print("root");
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("hello "),
  //       ),
  //       body: Text("hello"),
  //     ),
  //   );
  // }
}
