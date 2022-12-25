// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'popularmovie_cubit.dart';

class PopularmovieState {
  bool isloading;
  bool isdataready;
  String error;
  List<MovieModel>? list;
  PopularmovieState({
    required this.isloading,
    required this.isdataready,
    this.error = "",
    this.list,
  });
}
