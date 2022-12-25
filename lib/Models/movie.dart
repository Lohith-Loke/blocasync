import 'dart:convert';

class MovieModel {
  late final String? id;
  late final String? rank;
  late final String? rankUpDown;
  late final String? title;
  late final String? fullTitle;
  late final String? year;
  late final String? image;
  late final String? crew;
  late final String? imDbRating;
  late final String? imDbRatingCount;

  MovieModel(
      {this.id,
      this.rank,
      this.rankUpDown,
      this.title,
      this.fullTitle,
      this.year,
      this.image,
      this.crew,
      this.imDbRating,
      this.imDbRatingCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    MovieModel x = MovieModel(
        id: json['id'],
        rank: json['rank'],
        rankUpDown: json['rankUpDown'],
        title: json['title'],
        fullTitle: json['fullTitle'],
        year: json['year'],
        image: json['image'],
        crew: json['crew'],
        imDbRating: json['imDbRating'],
        imDbRatingCount: json['imDbRatingCount']);
    return x;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['rankUpDown'] = rankUpDown;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['image'] = image;
    data['crew'] = crew;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    return data;
  }

  @override
  String toString() {
    return 'MovieModel(id: $id, rank: $rank, rankUpDown: $rankUpDown, title: $title, fullTitle: $fullTitle, year: $year, image: $image, crew: $crew, imDbRating: $imDbRating, imDbRatingCount: $imDbRatingCount)';
  }
}

List<MovieModel> listOfMovieModelFromJsonString(String str) {
  List<MovieModel> L = [];
  var m = json.decode(str);

  // print(m);

  for (var x in m['items']) {
    try {
      MovieModel obj = MovieModel.fromJson(x);
      L.add(obj);
    } catch (e) {
      //   ignore exception thrown
      print(e);
    }
  }
  // print(L);
  return L;
}
