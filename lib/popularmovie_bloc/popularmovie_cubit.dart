// ignore_for_file: avoid_print, prefer_final_fields

import 'package:blocasync/Models/movie.dart';
import 'package:blocasync/core/load_from_asset.dart';
// import 'package:blocasync/core/netprovider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popularmovie_state.dart';

class PopularmovieCubit extends Cubit<PopularmovieState> {
  int _timeout = 7;
  PopularmovieCubit()
      : super(PopularmovieState(isloading: true, isdataready: false)) {
    loaddata();
  }

  Future<void> loaddata() async {
    // loading state
    // emit(PopularmovieState(data: [false],isloading: true));
    try {
      Either<bool, String> res = await LoadFromAsset.getfiledata()
          .timeout(Duration(seconds: _timeout));
      await Future.delayed(const Duration(seconds: 3));

      res.fold(
        (l) {
          print("error in loading ");
          //  errror in loading data
          emit(PopularmovieState(
              isloading: false, isdataready: false, error: l.toString()));
        },
        (r) {
          // data is ready we send data
          // print('data retrived $r');
          Either<String, List<MovieModel>> x =
              listOfMovieModelFromJsonString(r);
          x.fold(
              (l) => emit(PopularmovieState(
                  isloading: false, isdataready: false, error: l)),
              (r) => PopularmovieState(
                  list: r, isloading: false, isdataready: true));
        },
      );
    } catch (e) {
      // print(e);
      emit(PopularmovieState(
          isloading: false, isdataready: false, error: e.toString()));
    }
  }
}
