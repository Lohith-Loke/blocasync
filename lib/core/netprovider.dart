import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class Internetconnect {
  // network check url
  // standard timeout duration
  static const int _timeout = 5;
  static const popularMovieurl =
      'https://imdb-api.com/en/API/MostPopularMovies/k_u0cvz5wi';
  static final Internetconnect _singleton = Internetconnect._internal();

  factory Internetconnect() {
    return _singleton;
  }
  Future<bool> connected() async {
    try {
      var url = Uri.parse('http://numbersapi.com/');
      var response =
          await http.get(url).timeout(const Duration(seconds: _timeout));
      // await Future.delayed(const Duration(seconds: 3 ));
      // print(response.body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on http.ClientException {
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<Either<bool, String>> getdata() async {
    http.Response response = await http.get(Uri.parse(popularMovieurl));

    if (response.statusCode == 200) {
      return right(response.body);
    }
    return left(false);
  }

  Internetconnect._internal();
}
