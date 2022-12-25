import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

class LoadFromAsset {
  // network check url
  // standard timeout duration
  static const int _timeout = 3;
  static const String _popmoviespath = "assets/text/popmovies.json";
  static final LoadFromAsset _singleton = LoadFromAsset._internal();

  factory LoadFromAsset() {
    return _singleton;
  }
  static Future<Either<bool, String>> getfiledata() async {
    try {
      String res = await rootBundle
          .loadString(_popmoviespath)
          .timeout(const Duration(seconds: _timeout));
      // await Future.delayed(const Duration(seconds: _timeout));

      return right(res);
    } catch (e) {
      return left(false);
    }
  }

  LoadFromAsset._internal();
}
